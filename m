Return-Path: <linux-gpio+bounces-33158-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPqXAAOBsWmjCwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33158-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:49:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED2265B80
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 15:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B46531D8BFD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F20A3CEB91;
	Wed, 11 Mar 2026 14:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kw2J3vh7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+6v2oSJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C9A3644B3
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240332; cv=none; b=e1z3/QZRDhm/fkdb8qFLM1NyAS/8HKpUYlnYV0xz8LxALjasEsu+AIMZPyVKBjXtLKVi39/lKCJeCLoUvs7WsCJeGVo/hp1NjrQXboekn1HopzZDAVhw0ONM/cd93C7XSMaehkTb68y8Wnfmkz3kjQ/TMUOobCDjdtqSPk9m8Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240332; c=relaxed/simple;
	bh=Pz3LSqnSgZPO+sikjWgv6OurkSgn5CfbQsARgMnvaBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4bkPvQg8GVOgwf7oqr7bJt86Ayi6styhhvfQuI4ES3TTjsY3FQ9DsVkUiH+8BHid3Nrq3uu9iz78Ec6uBfWQlmN+c0zTqlkLsx464FJjkX2ObYC3KSwEe57syAkAVNpS3qyoxLHjULnI5vRyXc1rgluA5aT+sYS2WfYT6Hh1V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kw2J3vh7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+6v2oSJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BDPJZk508366
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hO8HenrdBwBFfXwe3brj0XRv
	Cy9c54B12m4F6gx96VA=; b=kw2J3vh7ymtz/kDj+rEzGHXzcJGFkEUWUPf0ur5W
	maaox5TuiYEjdMEYhxPsDWVJjVIIGGq4qgtySqX096u/zI6YkLGAnsB/EpWbaLTS
	IRjPKY/8/AKFPLIvnifmhm8HELFgKZZOgSfKFtu6OKNNXcNRruuUkUSnirZePBBA
	ejbUsKOAtg/iYkz4iTLIwGSkOtE4S624djbaY0uwbMAc1EfuyVko69zrVUnb4VMo
	ZwoPKd6BqvGv/1wV1Ls9FrrAEYoR8yTR6jMW6TLTFNdoLnxKgXYPFS5LzwssU9zi
	sJ23EtaBBIgq7TFOGJkfMB1wOehe0KK2vs0cDDfDBb9grw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppamacg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:45:29 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94ea014ec7cso3102036241.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773240329; x=1773845129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hO8HenrdBwBFfXwe3brj0XRvCy9c54B12m4F6gx96VA=;
        b=Q+6v2oSJIfT3fJM8A3YHsi5lPT/96LTJPj4L/trpvEWi9DR7hjIYo4GTzGkmS1s0ws
         2kL1h7hSPhVv9eTZrpOdzgycogPSv4MUsnPIsqHxT7+ZiJsQH8MAXeungtZs8ngvYm74
         3RCvxa2CiiOx39xdSqKv9R/Y52PsbVhqtVTEkJudOC5UsgXHpofgrrkF/RGuASz7OGO4
         ugY89voj8Rm7zA/wkJfAFZOabnem8pYFMBfrHxxlARZ4adnqArusEG3yXH4dz7y91O4B
         NP+d7LHCHK7JydKh6hFcIboOX8Ez6wbYx3A490IsmDrLWrPJogfR0aQuFL5zXZ4Quw1y
         MYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240329; x=1773845129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO8HenrdBwBFfXwe3brj0XRvCy9c54B12m4F6gx96VA=;
        b=XFh1Q80X1mfgvYwx49l2Ex3m+frGWX3ahz5y9KNqPfk76cQ33cOAg7UGU/RH3mpmXt
         tw+1wdG75MaYruh+48ffJ8KygoDhVfB912PMC/od0ZizsaX3QgSqv+bcHwmIw6885bPu
         /3vZmT1RejabLrjyx5L8tb0TLG+yw6qpMPIB7hcTqm35w9hLzI/8+Emn+HVzWooZJwX5
         7z2tbEUm9Cdo+XH2BE71DyCX8b8lIcd4hi2kPTDZQt8+yqluCW+LXPD2+3Ku91tg75a0
         Gjy7mDOjL3FxGvR7E7UsarWv7l2qK5SAREiE5MOSAFy1g081CJ3ld1C7Jh2x7oxjqwKY
         YC+w==
X-Forwarded-Encrypted: i=1; AJvYcCXByOAXUOrPvuDj3Ypc2gf0pOPFXFSwhlDoLkRj3cJw7HZVKuG1fDPVPYAhpFtxnL/JNzoncfVJsUqb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7IFyr2f221uDffVA1WK5uOxr/WggxR+rV2FfnvJJfMOroNFnq
	rWjLOT3kQvcl0jEqeK+cIIv7G/WXLmNhOesLuwyPDVz7rWxn19L1M5JtdSD5+jApbiHsWPL8uMG
	WuLAv9DKWFMDEzW7YF96ZjEvE63u8xhd9zj8ja+nftoYezMZlxF7RFTVLXVSZPHY0
X-Gm-Gg: ATEYQzzBlS9Tuoo4xmsCOL7UThZphJaYfNj9DbmuKtu/1F3yj7Rp995FVz+309tk0Gt
	O5gFQevwFoK9w50JdTYFPUvv3xtRifUmoO+BOW331wqcIqaUB6dTE9ZKSjMbOfH2wy7p00PL5ba
	iSbxxuMFAd+OsIBagdUxb/ahxJ1djy25d4F1LnUJ5f80bWYH3LdRIg3SFWd2AKCsnciCLa8OWTa
	BbzOmxta1z+/tmMrVPcQH72TkOd0gtCBz+mQvMtK2FmaGLFlmUku9BdhJ5msq7xvbwsrbtLvzKv
	AGQDEAKqr0O0/M/404F5pMQ6zWBxvEaWD5irCRqd0/7moA1atolPhuCIgs932pZNjzLM6ETmzBb
	GkQUWktdE9zb9SeYbsxFwvkczt9vJ7rUAG48Ua3sF9pAL5qJPPKnnQJArkPNT2VmuIBlh4gEpmH
	Z51SEK21++Oq79m+q4beLpaIr+QbQbN4iQ2hM=
X-Received: by 2002:a05:6102:41a7:b0:5f8:e47d:165 with SMTP id ada2fe7eead31-601deb1bda7mr821301137.8.1773240328595;
        Wed, 11 Mar 2026 07:45:28 -0700 (PDT)
X-Received: by 2002:a05:6102:41a7:b0:5f8:e47d:165 with SMTP id ada2fe7eead31-601deb1bda7mr821281137.8.1773240328114;
        Wed, 11 Mar 2026 07:45:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e6788csm3872241fa.33.2026.03.11.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:45:26 -0700 (PDT)
Date: Wed, 11 Mar 2026 16:45:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: Re: [PATCH 4/9] pinctrl: qcom: Introduce IPQ5210 TLMM driver
Message-ID: <mb5x4jspf4fwinimjnfhlf45gee2bajqxcp2nglqqkfnulnmbl@4lvhh2llnxjj>
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-4-fe857d68d698@oss.qualcomm.com>
X-Proofpoint-GUID: oLQeIEK4hgARJYKrvUoXbBmoa6ZiDTQt
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b18009 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=yEwgHnYd1rMVcNmT1VcA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyNCBTYWx0ZWRfXyjXmI2H6scnN
 FyFiYNeZCyZFoCTjavkpnDLXEFSu2gfdxrkYXR3GwTLc3COvwR4VkloL+Yp5ifykEdq7sFgR+tB
 DEWl6Fd+J2o2mdW/oKximuR99kGhATdu4jTj/OXNGB1FwuwzGmbwfbC2WIn1XqPE15Ax4B260Py
 vNqNHDY9RA3r7Ggjt1YYzIEbm1sUthlUd8PhZeU6UrD28mrFmzmc0f81WVUFF/QEzvFr/BxyoF7
 eohRAUdXBOf47N1zIdgLqdAU/Y3BKdQATrdaswzSqYwA6/JIjLI9TfdBTh6eP2qCSmbzaiyBBeu
 iO7lYLWLqvrmv8vgpxN8KKyj2YNt/ugovDl0armr2Asr8kX/kjpQKvYUjQh7ptg4eCpIKLvvmNo
 cNeFXRT7qgzIxY4G1m+6IqLZhbzDWSYAWUOY+czfD/nSFVeBZeN4dd0eLwbbinYaoBWDaLBGEZB
 7GjG+4n8O7zNaqVXF6w==
X-Proofpoint-ORIG-GUID: oLQeIEK4hgARJYKrvUoXbBmoa6ZiDTQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110124
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33158-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64ED2265B80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 03:15:46PM +0530, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm       |    8 +
>  drivers/pinctrl/qcom/Makefile          |    1 +
>  drivers/pinctrl/qcom/pinctrl-ipq5210.c | 1156 ++++++++++++++++++++++++++++++++
>  3 files changed, 1165 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

