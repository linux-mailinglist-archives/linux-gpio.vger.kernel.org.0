Return-Path: <linux-gpio+bounces-32875-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCTcCDCUr2kragIAu9opvQ
	(envelope-from <linux-gpio+bounces-32875-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 04:46:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6E9244FDD
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 04:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 888CB30158BE
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 03:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12879399007;
	Tue, 10 Mar 2026 03:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+CbJ+nl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a22F8Eq4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B076B1DF25F
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 03:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773114411; cv=none; b=qYWhIqroTWP2lwXj/rliGETT1NONbIW3YMQtUhZCnsT7EF5YygfearNwVj5/SknJjQaUjjpjBUDL8LOKNu9MDugVfcnQ3D7tFDxpHf1y73BaqFisMNrRuAJGJgJIenUYuvBkLI4sQ/edA5uJqxUijpn8wsqILttaX+Yno1M5L40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773114411; c=relaxed/simple;
	bh=EuD6g6RNFYBCMCyD5nCeQMTTjq6/Y5prChgeatFAeIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fis05Vc3At/jHjzXxbSjC1vNp2zdakzkb5PATrlxt33OM7JSJBvqixc1NE38cC1w9TzMQ0TSvLJEcjJXYM/KPs+Ga5M8tYjw8BtNqhuQw3FXdM+m5GD71vKh5Yv1Ppm0Cf0466os9UGC8hc4x0XJwK3Up5jMIjFf1mcCTiPJBYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+CbJ+nl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a22F8Eq4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2ED2l3754518
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 03:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1O0unU++X74+aWtoWQlyW8T4
	RoRx1uAMlD6DQ2sKW5g=; b=E+CbJ+nleFqIKvJpALTsC84i4lom6w9vZCob6K7a
	qUJRs0L68MbiYaUgJYhAJKqRpSSGA63OKBE2/+Uk7HxiMbYqZ4Hs70r7F5msBFqi
	gaSm3wvC1rA7aa85MXlAZYe78JqhPtUJ/1ezopzOJMA7acRnmaCKMttydWRdNnTx
	yqMybGRzKM4yhjIgeYmcPvesyCf/ezQQxLWbYBpKq8ll60g0wO8JhWB849bMh48X
	RMQoh0CrIon2dlRWzuf1vjVe4CoKMrIQFpEJsR2tD+AyI1dxlsXLnzgMVhoK+wFk
	DrIXgYTbUl1iGbW48xpHszD9cwSc0vn/DuFhamdi7UK0cg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477hbgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 03:46:49 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94eb847f11cso7078288241.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 20:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773114409; x=1773719209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1O0unU++X74+aWtoWQlyW8T4RoRx1uAMlD6DQ2sKW5g=;
        b=a22F8Eq48EIN91iMQ9+7Cb3JUaTDZiHEXP2CqXm/Vt/fJwvQoNkl/P23BdJ0fiEFQo
         Mqj7IA4AH4jT0DNEyu05pyzLaTtseXKcfhgth+UUZ2WQOh6XnqcdnkAwMwv7MCRLCHDs
         thijcMoxlmPsv3M2c2CE7GJb1fOe+BkxZXjJbfNqXPLmYFBm7kJRrQMHWDeRmcTAFa6I
         ciVRVH1e9IHcuwOcJzHlPvv8ViG0AB6Gu8ECGkk5LWZD0ztpgn9WdtheO3BMUp74zP3V
         pIQKMuZCUU5nIDOocOZURcIELKkAOkOJeK9lUxIZ54u0i258wOZzNyi0+yeZ5v2bbbtl
         7U1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773114409; x=1773719209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1O0unU++X74+aWtoWQlyW8T4RoRx1uAMlD6DQ2sKW5g=;
        b=sggRAMNWQKOFIUmSCZwHlJw2D2cLj7wRaBRvSXyrONVYtDUIjEB30tcpMNkNcL7caR
         0Tq/6MvTkbul2jY4dQULYOLNYb5/w0gUdG4o3kGzZ+Nyl+Ljvdc8a0E+XqBM/biPYMf/
         PiZBSGvnJkzYym9ZUwSL6thcVYNgUXwHdVBvLX6GIHA3WbnKcQrylAVRhewn0FmCHBxG
         fvrBVXYkC80qXuzx7eUmHkaRysyL9CqGQU88dpl9zYIzHzkD0cUQ5ZTDNOgYGIi0TOCY
         qv4+tWMGww1BX8Ca/lYpNhQSDkp8brhB3p0H1hRB639LZe7O9Q0KCxfiUVa48yW95hWG
         gfWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU97hQn6XwjmjErw/uZlvreFC3rjrj1k+2vsr1hXuXUuUI1MxPqPvKmttH983Xs6qAFAMCEriN0gWkP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9F1wx+UA8brmPYxaXZmN4ZKudNGgJmM8ibgGzHUNztWTmosvL
	Dx0ZFxs1OJoTWUUYRBywct6qy6AbRQcn1nMQZPOiD+i4o/SaYfyq9viYBzLC8U9UoTTzFW+Sk6f
	pqF2XPwhP7acQlWpZxNbSqpIv0q3qcul2AQMIRTH44RbUcTftJAGiSpqjKUIoHLBg
X-Gm-Gg: ATEYQzzWY44mnvi0XB9V4jzyz3ZoQeGpOPu5hC7occcHWtB2Ydb7wEUkEJ6Dlr/NzZ5
	vHM0A4CT6Vm1zmUZvTJJw+AbXfJ4qq5C2RmJID2vDbPk0vKcsC9WzPijAuZmP4n/2/4gYIDZjW9
	j95FVmFT9OS5fSuakjYSXtHbqF0qHF7Pb++TNAr1KaZniTSFl9a58V0XXmCRmd538uhELPTNA1L
	/7Vx3D+32TsAOEhYQVBDfXo9YXt6SIykcVGMZ37yDrVsDOfsytc2T69df14cp/mN8ydFQXRQNqL
	8U8UwzhDEYzUuvZI8m3bHbewsIX/7yHPS5ICt6hruNrHJIN/2RDlmMMy8/3762LbJoyXh56TxKB
	HT1N9+mxIXm4XT6ZJtw9MTFper9M69s498p/HFbonJsGhB0GFChJA9E8ROFX8Z9anCfd25YClyu
	N/rBfIaquYJDJQnwfk4IsnZqIRXx8pbYquoG4=
X-Received: by 2002:a05:6102:54ab:b0:5ef:b0d3:295f with SMTP id ada2fe7eead31-5ffe5eba430mr5759731137.8.1773114409166;
        Mon, 09 Mar 2026 20:46:49 -0700 (PDT)
X-Received: by 2002:a05:6102:54ab:b0:5ef:b0d3:295f with SMTP id ada2fe7eead31-5ffe5eba430mr5759713137.8.1773114408786;
        Mon, 09 Mar 2026 20:46:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfa1264sm2509461fa.9.2026.03.09.20.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:46:47 -0700 (PDT)
Date: Tue, 10 Mar 2026 05:46:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sdm670: add lpi pinctrl
Message-ID: <o6qyvhcmozixpj6yph6dfd3ddzvv77xgx73setsuq34hnmirf7@ovnrmqmm6liq>
References: <20260310012446.32226-1-mailingradian@gmail.com>
 <20260310012446.32226-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310012446.32226-5-mailingradian@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNyBTYWx0ZWRfX5CztOW23vtso
 gsOX/gljDgjGPWXDNP712bY5argyM1SXPDn3N4n9NYqz5A7E6vsF7mOQJbGLDlbgcDkCCNaIZKo
 EaZWxLCu6YMJTXqm18mO85RhbZ/rBZvBR2bYdbt6JszfXxdtnlTcf8IicBXoN+Fl1s/e+Up+Hvw
 zuTjxvX4pvAB9Yp3d2DLeuA/4msn76/Z62KgjwhTTNSdx51oJNTBEtRB+G+lRWHDA0LKlDQY5Hx
 p208BTmSLMgP3ggHvQZquudCUoSJa5t457TRbpLJx4oq7WahC+rVwxaFUbgay/p1gc9h9mcCBaH
 e/guN7bACwzr9zC7adTXHirJtIVoLkjJaG9csDoXEQRzeGYAIb1uy2zA+nOEphhrJ3pNsv5yNiw
 HOvpKd78cZYhi6EiaXG3S9y1E0muI/WMnjWG/lzdRypc5p+ChVXweazRYtpDBO7ffKyKTybdXHL
 CGJl2axR7fITh0jQV0A==
X-Proofpoint-GUID: 68Pjl7TaRs769oxgPmrhaHPhsuG9DOUu
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af9429 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=TIhwJpUIZt9fiVsXp24A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: 68Pjl7TaRs769oxgPmrhaHPhsuG9DOUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100027
X-Rspamd-Queue-Id: 8F6E9244FDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32875-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:24:45PM -0400, Richard Acayan wrote:
> The Snapdragon 670 has a separate TLMM for audio pins. Add the device
> node for it.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 73 ++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

