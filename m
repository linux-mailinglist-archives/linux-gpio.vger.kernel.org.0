Return-Path: <linux-gpio+bounces-31715-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOnROTgUk2nD1QEAu9opvQ
	(envelope-from <linux-gpio+bounces-31715-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 13:57:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEE21437B0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 13:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7F2230071E3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 12:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E561C2C08C4;
	Mon, 16 Feb 2026 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VPt2dcPh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADw7eDEW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACB023B63F
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771246633; cv=none; b=fdMHKMRjduxU8CqjgfryFTdXC/Z4t03HTFFYQBjMUvByH/IE8Hz0E56xSL/PM5f1WEDFWg5i1rF+RkF0uGDMXvzTl0+zpwlV6T5vhj+GDGRL9yekul1R+OjIkYWIs7stnQkyga/buMrAFbygFOHgULATXO9cmISDcW3r/tFjRxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771246633; c=relaxed/simple;
	bh=z4MJ+GJkMjUDCrarubv+ZVMh36vyTkkJmvnvdmFEBvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9+ZYRxPRt5G8vvgYjpohxMt0cFVBLLBq2uTNLrID/TVUsB5KlGCQIJoe7Y9tnleWFWF00xX236TmFvFIcTI+p3U58iStYZJHmaIZHVmPJXMm6GLKSpqHbzsgsjn6CehoAOD/w2cjL25EjiO9UfsUARQWS7nr7JxKHPK6Ld4cCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VPt2dcPh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADw7eDEW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GAAnkK1245841
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 12:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Ii/pK2WI+XB8PLPw2onVmus
	48zyU6nHwxPOKKOcA3c=; b=VPt2dcPhoTQGYgxPKzXkkfGLAYu+bt1zldjFsGo3
	jZgNJgW8FgrB4RkPKhnz5V89bJbVGXh/OO1EBlUktRSBhp+8gErjCFULcis0lbJ9
	XfjywMqljTkK1cQwkAg5Pool0/q/ufh9u4TW1vGsANLMRWQiQULoIktuDxiIk/Hu
	40Ds9uAA53H/9d8vQHYMi710ToTU5iyvnZGqzwPVlQ2BD1CKW/Iur8nxIeDH1l+y
	g9yxZd0kSXnWrXc2wLH7n5LNwMJxNskMh1ur5KsRxrJlNCKKwtNtk7OZYGVtk9v2
	Bh7NmNgIl6P2DG2CXAaXNzk2yAtk+eiHwMwle11D3L6ysg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cajb8venf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 12:57:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a2eb984so3346626085a.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 04:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771246631; x=1771851431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ii/pK2WI+XB8PLPw2onVmus48zyU6nHwxPOKKOcA3c=;
        b=ADw7eDEWcaqa0YwzOR9jpQw6b0eTGGADC3H+1KlRl/lHeZ3XfSF++l9bigmjPhP357
         Zlev7qIXvgJEowkd3i/zxleVnuNgdC/ftgvbvpHTDezI1TYR9TXF5+9d6BshF//vWRqc
         jcjGYbgMIHf32EnVmBAQt7Usf17LTt7apGC3NrVAL3FQtHl/6kqYoZ/mOcXfn2iS76lw
         1vnESAWaag1hvjjWDBXg4lozd+mCYaQGlTDOazzBGi9DPrqXLlwr9DZiQ+Swlg0ObKHj
         bRSBxSbakTddWfJbOVQRySiNSrlRfeNOFTxrmLXebzKR/cBWxwfMbJXaI+k0ybDgLxpk
         t0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771246631; x=1771851431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ii/pK2WI+XB8PLPw2onVmus48zyU6nHwxPOKKOcA3c=;
        b=dqkDrSckxmJ/jCwbevmIGv+SXRK3RftUpeDHuDYR9X/vpjL5NQ3v0oF0Q0iITK18JY
         +45yHDZSU26u9QQLi2z6l4cFW4oivjdedjnt1sNpcc67e7ieJuBbHo+2kQdIVhSKz8e6
         414HtaC/wuq4DgXBjya+ZRooLY9SU1f5lnbM6UDmFZ+Sobl/hVLsjUn95dTeguUY9fYH
         PS5r00UZCyVWPGBGNfRzq603he5vS67xvSFWFlH3pR3R8jBU495MdfgSCaUaSZemxN0z
         jOdikXHK7p8JWQbz31eZw2NvEJRps2jyuq/cmH7MWe9ybiWpFsys0b1y9GXyVQJyDXmn
         7rgA==
X-Forwarded-Encrypted: i=1; AJvYcCWQQgCHsFX2b7KPWCfgXKm8ewtVbEpeUEMnUJNMMh2EZXFR5mobfZAY5RE8LYyXMbURqY+WxqLZ/2GT@vger.kernel.org
X-Gm-Message-State: AOJu0YwBTZnHeEJNkN+OvfEtZiP/0zfvEuEpKksB4TrPxnIHywaN2jui
	P1x/WwpaymFtnQ0L0luWKfMOUpG1ldRSLSBdCwh0ENLLPaB8kjVTbBqKS9Q39F3MhYYfXO9Nrv7
	0kFkkB1cf2puEMlM5Zg8iVdTb2jHTOrx5tId0/jtTkhw/GPaUwYEH925PasOq0M6e
X-Gm-Gg: AZuq6aIzZ1c4rVImqkQssqPF7al6qaSDjhLm6+MiMHoie+2d8IFoetN04N93vRAf2O/
	/Cm8SBrMxQs6Xeolk1qHNzOehO61xUcT+vAlmny0SIJRl/u7JWRzqq8kK64tQs292dY25ACQ6CN
	A4S/6zcwD6zahVdNT4QxXuF/2YlBaZAL8Dt+xA1i8xHkQaF7D/9T2pPFLy8O9zI55BPQwJNhr0u
	tdvikcc4dQL3nElyLEog7BQcXe8oUYcTwOY6Ey5eWPw9Fia+1d+/REM+26NXty0BvcLujD5xkun
	V4WuTg5zWFdPZOzLk7LTRqgIkF3jbKp7w3611fvrA/hNK71f8vnHKtx4o0h/1s6DCsSpbFaODuV
	D21LInVQv5LOAhIjMkRFBVieNkvO3Lzd2d06C
X-Received: by 2002:a05:620a:471f:b0:8ca:2cfa:822e with SMTP id af79cd13be357-8cb4c007597mr944116085a.70.1771246631010;
        Mon, 16 Feb 2026 04:57:11 -0800 (PST)
X-Received: by 2002:a05:620a:471f:b0:8ca:2cfa:822e with SMTP id af79cd13be357-8cb4c007597mr944112585a.70.1771246630464;
        Mon, 16 Feb 2026 04:57:10 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm667083035e9.9.2026.02.16.04.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:57:09 -0800 (PST)
Date: Mon, 16 Feb 2026 14:57:08 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Eliza Top
 Level Mode Multiplexer
Message-ID: <d2gizc36kdz6xrj5r4a3okx4cqywenonoe4zogpdo3xz22x6ro@5b5l6qwfljcw>
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
 <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
 <20260128-hot-camel-of-acumen-eef9f2@quoll>
 <5teqin7wl2n4spyqrt2glyeaxe5tm6zgk3tmzs2nhj4xedurrp@um3y6enwt7iz>
 <yhnnlbvcqgtaseoiarii4rfsmiem56hxsiuibf3kyux5ftebgy@dhkhij3qq7sk>
 <d15efd8e-079d-44e7-bc2e-63d21f219ade@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d15efd8e-079d-44e7-bc2e-63d21f219ade@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDExMCBTYWx0ZWRfX/12JkiczQ9v2
 iUMt5QJQOUmjwQ6azBGwbXDlXKX2OB0xZP/beGeCQ1MyhcMN2R+du0PE5ckg47i3m0FF9O67Nl3
 lAVnWynTGgoDK6mG2AmIpU9D9pSt35BsZBUhjoo3d3b5o+wimevb/YN7TnrR/NAZkyNL7q+KFmu
 W6wr4lt6nyJ2l8ag1J01LjdQdFicNDMUpCX8Wf6niG+Zu3lahSIusmFVmzoosuJrXpJJdhHx9sR
 2EU9go7MAaXjZhy8nDwMQWo04kDDmeu1rxkOowuEqB1utz2fDCBA7Qt08n80NARd5N4gX41CwVT
 P48hg7jNsemzBVjOW8XFSJl1CdnspaL2svY3nXn/QyGqAIWK5Z6HETEzGSMGBlnf5gqzaHzuTmF
 hLqUMsNut0fn6L/GKxR7ASMVEYdCTEKEGe3SvEYuVG8OcfIwaWoz2SyY8lVrAGZKtzkzWXOEe8a
 fDuCs2WO2D3rHWi5Cmw==
X-Proofpoint-ORIG-GUID: zGCc6C4kHsBupKO_XZnBIqSKipBvd_Il
X-Authority-Analysis: v=2.4 cv=Pe/yRyhd c=1 sm=1 tr=0 ts=69931428 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=YtSwxCjKp1_K-LVzdxYA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: zGCc6C4kHsBupKO_XZnBIqSKipBvd_Il
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160110
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31715-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EEE21437B0
X-Rspamd-Action: no action

On 26-02-08 11:04:06, Krzysztof Kozlowski wrote:
> On 29/01/2026 11:59, Abel Vesa wrote:
> >>>
> >>>> +
> >>>> +  gpio-line-names:
> >>>> +    maxItems: 185
> >>>
> >>> 186, your first GPIO is 0 and last is 185.
> >>
> >> Wait, are all of these wrong then?
> >>
> >> $ grep -r "gpio-line-names" Documentation/devicetree/bindings/pinctrl/qcom,sm8[3-7]50* -A 3 |grep maxItems:
> >> Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml-    maxItems: 203
> >> Documentation/devicetree/bindings/pinctrl/qcom,sm8450-tlmm.yaml-    maxItems: 210
> >> Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml-    maxItems: 210
> >> Documentation/devicetree/bindings/pinctrl/qcom,sm8650-tlmm.yaml-    maxItems: 210
> >> Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml-    maxItems: 215
> >> $ grep -r "UFS_RESET\"" drivers/pinctrl/qcom/pinctrl-sm8[3-7]50.c
> >> drivers/pinctrl/qcom/pinctrl-sm8350.c:  PINCTRL_PIN(203, "UFS_RESET"),
> >> drivers/pinctrl/qcom/pinctrl-sm8450.c:  PINCTRL_PIN(210, "UFS_RESET"),
> >> drivers/pinctrl/qcom/pinctrl-sm8550.c:  PINCTRL_PIN(210, "UFS_RESET"),
> >> drivers/pinctrl/qcom/pinctrl-sm8650.c:  PINCTRL_PIN(210, "UFS_RESET"),
> >> drivers/pinctrl/qcom/pinctrl-sm8750.c:  PINCTRL_PIN(215, "UFS_RESET"),
> > 
> > 185 is actually correct, because ufs_reset doesn't count.
> 
> But you wrote in other part you have 186 GPIOs. I don't mention here
> UFSRESET. If above is correct, then rest of your patch has some issue.
> Anyway, something needs fixing.

Yes, for the GPIO ranges. And it needs to be 186 there.

