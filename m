Return-Path: <linux-gpio+bounces-36751-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LjGFUV5BGqpKAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36751-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 15:14:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC360533CFA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 15:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F461329B329
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 12:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C99A42E01E;
	Wed, 13 May 2026 12:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OS2XJKnW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3mwXXj3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF72D42E009
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676722; cv=none; b=tV1zh5f8B7Qci6mJWHpnEB0flidtmDZlRByArVpFrpalJ1WGgXVzz4Xj9hrPZTt3PaOboE5irm5oVMR7ro4Z8lvEkYXPubEse+8uZ6OJL2PFRZ6+hehglirsYXAY6Cc2eFGhgWv6UYhdXth+21JlJlnuuU1Kwv6YDgRA6xxlEt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676722; c=relaxed/simple;
	bh=wwLUbUGyaC1VyFAlTkDUqC9ZycGiH9OlwuknxM9cXNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvpQuC4agQCkQ97TKJqq5Lz/Gloe/RXTkTeCcAEIRbCXTM3PBkVrZoxIzd2mpvIOIQvKVPUI0/0USsawQ13qug2C5kUxgjWHrDqEtDcocAUw7gTXtajGiV9VSS/DE9Gk9Shu45dcMIKRUpiimN/nhzRMOQ+pisE1Mr7XPvoP/CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OS2XJKnW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3mwXXj3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8n9qg2887823
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5AnKdJJ7o/qdivMQgGp5CzMl
	XN5/RLPbFR1xqXLbXN8=; b=OS2XJKnWlBNYgZpf4j8nUZ7W9jsy8FmoXfczGVsV
	meqinnyJpHwWqT6qKjW82fB4oYUI6aL5/y8H2srL0z2k9ixDUfBYva+8tT4v04Fy
	Qn6GNp9EuBNR4GL0c4Y47XI0PIP763XnryIWU5JpCEqqvlGS9qltu/qovELDoZGC
	p+kJGnDQ3IUnsvUArjpDjNolCBEXdFvwyfysMerdXFiKWblGVBrAhpVdlzKxu3ph
	Qp1G0h8ydxE+P2utXDysOqnZIa8YjlbJqcV4WZ+gy1+zmuhIuXpEIpBV97hUPJqu
	/EFK3HEb2eADnIyz9as3j04Y/5A80IZCTLLXCMf0ojgTGg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ggvg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:51:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5162ee45a77so16209691cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 05:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676719; x=1779281519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5AnKdJJ7o/qdivMQgGp5CzMlXN5/RLPbFR1xqXLbXN8=;
        b=A3mwXXj38CZm/YRAI24c7hY+0YTzMNtmDOKKosuU44c3AbszNYNpljWaQI8r15zdmd
         BBXvDWiWXoTlYx7y7c6FGTciJ7Ha8nwvWydb2NNawi/41oUaPa57fTCYtf7OiuQuykjI
         g91EVByr4lLchIC63idyDci8IkoCFnJNq6Gv4aVf3Vv71srQ3QzeOd6YDAqgQzhZoyjY
         riQX1KRARiyOH0W1PkwSP5gNZn3g+GcrsKMhn+EkuY/602sdKdNcP+y4QiTm6kTPNsXm
         mTdhL/SnkZZYMemdZ/P8+dovjLmSYUNMp7OVNbyceVAtOIFo2YJfAevpcbK6Gpw+GFKA
         uhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676719; x=1779281519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AnKdJJ7o/qdivMQgGp5CzMlXN5/RLPbFR1xqXLbXN8=;
        b=S+L74Qw58VZn4Hr2ikAl5/NJ/0eiUOpeQN/VoNZ63Aa2WGFkVvi6BlDUrT3g8+H6fN
         dhKikfsqdWwx4AR5u3WAMXzFQdLtacu+fsbUVdQzOS/2jhnlkLp76qtmzjfnwRyPrP5s
         TFJQiFM+S7OwL5c1Jnz298EyFUkMsXSJC7npa5uH9CQIKjqrQN+dylFZ+S7np2uVS+ER
         iPE0p8HpnSjRuZlWiNT0iEdVfBl6yToGiznadvkLChnNV7V2AvLalgbZJpkBLHAB0vjd
         VZh0xN5k3j4Z+J0pQg5EPWaJJSp1Q64YQEhe8pornnKzgLlC8TODd5Ig+J9LrtM5MDhq
         tj4A==
X-Forwarded-Encrypted: i=1; AFNElJ+n4ZZu88B0F3crAN6XUzxu++vCXrW8u+uE7i9vdvPnFUn8vR9SG2VCQxk4apOfgTTChEBzwISKG6h9@vger.kernel.org
X-Gm-Message-State: AOJu0YzhmI5Yt1amxXU2KIAwXhNBMF2Gk0MEOiyyjmO8YzeKf8kzR1rW
	sDjk/TIWOGQyKeHRDSN1uZE06pwl3GnqUZ1ZG5t/79mct7TTOcDc1pBBtaujlX6Vc1LXmjMGvMu
	kD6f2vFs1selll7XvbN7ZT5QUvacZDFsr8mqmS/kIvt+GeGkdEMBRqS8WzdGZYAzU
X-Gm-Gg: Acq92OEPnyijWwdqhcPtm+RzvzrYvX+7CKCUCqWtfHAErAJAy93zFUepPIQs/rRT/E7
	NO3xlcsDsg5ygmnZDTx9XTzCEpObWw672lFBRjt0VT/Eoti2tIiGre9BiYSVui3qjt50pV0Zz7m
	tOhoFMwNOHb3c1qT8iiN07NhB2ETlYkbujfS6Y2dfISY79h1jOP+e+E+iKPbN9QWJGPDqLUNpOI
	C072I1DKfNZ00UcTH8igOsqtD8x1q9zyCiaSNjSj709NwW0V9DCfzRQtHQ80GygsvdvDPjXveK4
	Xae/x0ocmpOmx3twFNvbpb9ARQRPvbaOPFOtTnVbW2p6rhBkPKMBL+b6skiMsZxkQF2oX0Tjwfr
	oHpHxD71mCIeCKZUNUbK7h0UJPNqx8qde6XCP1EKUS9JEgWRs1dKyx5XuI39Kfc8b7bHMWyHULu
	JK5lBreRIn8IpkPeiSDyI8R5HxadrAvlmlrr8=
X-Received: by 2002:a05:622a:54b:b0:50d:a301:2fc0 with SMTP id d75a77b69052e-5162f51ea0amr40579791cf.26.1778676718906;
        Wed, 13 May 2026 05:51:58 -0700 (PDT)
X-Received: by 2002:a05:622a:54b:b0:50d:a301:2fc0 with SMTP id d75a77b69052e-5162f51ea0amr40579511cf.26.1778676718443;
        Wed, 13 May 2026 05:51:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d317sm4035670e87.26.2026.05.13.05.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:51:57 -0700 (PDT)
Date: Wed, 13 May 2026 15:51:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH v4 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks
 on LPASS LPI SoCs
Message-ID: <a2x5hg7uuok6pfeyfaoq7ym4ffekgmfgbnpmninkmdugwf2b6l@tb5mhs2xuo6e>
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
 <20260513122542.3726319-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513122542.3726319-1-ajay.nandam@oss.qualcomm.com>
X-Proofpoint-GUID: 71Y6ATSqtOujRN7tuqmiwF1CTRGW1VR5
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a0473f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=4BbeL_lAFTVXvkP5OvYA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 71Y6ATSqtOujRN7tuqmiwF1CTRGW1VR5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMyBTYWx0ZWRfX3FYiPkQRHLpJ
 MFP18jvCJUTfqk0DdQC+70HRqSAONEx+k8iLniy/Imypnxlc3qLsXKVasntmwxKBQLdDqWw1QY7
 JtSUHIB9X5nwHd2Z/8Em70TqP2F/jibBHlR8clkwPNMyjnN7NYsKWH9FnGydTv/LbjJs1jZu+rS
 Cu8MzqmIpNGTcA+F+A29PPnvyn8Otlp9znAMwukm5V+hVseFOlUdmXiStKwxOiezbExX+xT6msi
 cibP9lHO4q9PkVebusB1SN3eS5nJ3UwpTxj7SsD+GaTuNmBGf76pCOuvBTi/b+E2qAbDqYDh3JC
 5/0uZqUifZJ488tHZDrx1BMh2ql7GjgnZoH7BoKH67mzVDRFEiCMUW0/HEu4JcNobZ/+O90j1G8
 0O4HFzMHb0SjJJtgu2uD6kiCQ5ARyBOnMQU7kC5lnKnny/e7LHxFfvBiRsmc5OpcmJsSZ5jb5CN
 NQfunmXNpoqAjNJ4IXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130133
X-Rspamd-Queue-Id: CC360533CFA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36751-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 05:55:25PM +0530, Ajay Kumar Nandam wrote:
> The LPASS LPI core conversion to PM clock framework relies on variant
> drivers wiring runtime PM callbacks.
> 
> Hook up runtime PM callbacks for the LPASS LPI variant drivers touched
> in this patch so they are prepared for the shared core conversion.
> sc7280 wiring is completed in the following patch.
> 
> This commit is a preparatory NOP on its own, as runtime PM is still
> disabled on these devices until the following core conversion patch.
> 
> This is a mechanical per-variant driver update that relies on the
> same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
> pm_clk_resume()) and DT-provided clocks.
> 
> Runtime behavior was validated on Kodiak (sc7280).
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 11 +++++++++--
>  drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
>  drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 11 +++++++++--
>  drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 11 +++++++++--
>  drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 11 +++++++++--
>  drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 11 +++++++++--
>  10 files changed, 80 insertions(+), 10 deletions(-)

Please don't send new iterations of the patches in reply to the previous
thread. You also didn't send the cover letter, making it harder to
track the changes. Please switch to the b4 tool.


-- 
With best wishes
Dmitry

