Return-Path: <linux-gpio+bounces-31283-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGDEGFI7e2mNCgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31283-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:49:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 148A3AF1DF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E9A53074703
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BB93815ED;
	Thu, 29 Jan 2026 10:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdQj08rI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvFpKhs4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E9A2D12F3
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769683316; cv=none; b=t3tgkH/WUGVcUsmwTN/JD1P+b+s4DkVxBsfzRqXDRXfeXNTRzZxfp6FGj2s3+nNMYvKa/SkJfMBZsNuybDbA4zRMcu/hEwpQclPo/8J7YtNT4Uyu8bMfUtnxDnbtimVCuSOKEEGnvR/Tsrjw+C5VtJU7ziOErGgatbFertjpXXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769683316; c=relaxed/simple;
	bh=zk+1O1yq82iIDastvmqkaAwAmTL02X6M9Y6PekCo/CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuTFhd4bemob9+CWJliSfWFe7JVegwBIrGT/ZXKGSGkixZ7nrUIfKAyF66/ufmnW08w5Xco8+iaMNjfdUV2c9E4cvvIUgjM6mTA9JciAdGOg1d+qd2VLomcc3993v5VdvJgPN2pw32iCniwHfsPmT0BXK4hfHe1q5+sWnJzclM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdQj08rI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvFpKhs4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAaTjb1432572
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=78yc5FN4eslJFV/3x/1+L9rJ
	7RkLelm3oGphAVI930Y=; b=LdQj08rIOk0vOQ7zGzkyJoPBUn62ZY4TWqL1V3LV
	Sxz5UGtn5AvvaVgpX9CgmGJcsl3Vp5W3T4k0okvwoXug16XtNPiLH2IdL6LnEcCp
	UvELoDV2rJNqwzyExU6YGcU7p7uyLURQ/018017NkNzeDwWZXX6crqaTqdz7u7zg
	YoPV6nGk+aA0++dKQ8rkzjHLUZ2BfC/h5u+s8PcTi+flI8eNMqBDBgXYukoMje8n
	19gm43flbKIGTF4RPwIEv+a6H4KXDzzCDSr5HhwNWmhiazItq5flgBaXbuO3kAda
	doAii1W7YKOunqrZF0yVAf6iwqNRxsvp4XHvxGI8U1B1Pg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byydh19yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:41:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c711251ac5so214494485a.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 02:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769683313; x=1770288113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=78yc5FN4eslJFV/3x/1+L9rJ7RkLelm3oGphAVI930Y=;
        b=bvFpKhs4bsnxR3EM1DdoQkK5iLnelZkxkBuc6uV/alSICjBMNcEFEkFLFlxjSzS9nL
         YA3ooM+KkrBwqZg9K2MU2vY1/O6adOQomE/bCysFTjexZZVMTRqXkeuMvQTTKZJS6XS1
         GHvbL+zGiwiLfjr4vOURvZa0PwDBYvzDki+7XGAbATXcuu6jJmqqYByrAZoCg9TS6A2Y
         XjMLZ1paJks2jBBBwJ4KY2RS5WelsDZ/SmFunGSkyWM9JkIIYote4YTit7lXjj51q2v4
         g+H3eh6NJ076ppdzCiWoLAyaq4Zom2lF6QG5vtvW+ExjFZKMKxkW+9z/+7JH/58bUp9M
         BjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769683313; x=1770288113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78yc5FN4eslJFV/3x/1+L9rJ7RkLelm3oGphAVI930Y=;
        b=gByZyYmIzP0X7273eDkWCNX+3LI9qCmgddVUSvtOQsn8By55mxEyLCZ/N7j7CLz3/9
         t4bpjp7mVspVX8p57Fk692eO6g1stsEtLTVebk0NzMoaGnWe1zNfigP4dkD8BaVMQzja
         E0y8F5ZkFwCvf22H8RlJQb1dIvPM0g+eLIMduRniXWHTRr8ywjnMwsI8aQ2KoTD/JMn7
         VecYaVtkGl29mKIv6W6qWllebjNU9pGwLuIj+7r8MP7guG2MGQDVXNuYBfx9LKl/UW1Y
         jntFqONcntYrpL+F57PD/N+JP7RWTadIfwZrDhrEL3MdBEawSTMaNM9At/C1j+0Uwsjb
         LHZg==
X-Forwarded-Encrypted: i=1; AJvYcCW2+GqVzPTfBRo00KRibUmucDA0NViR94Cyq7fHdtaE1JM7+RwOnEVtXI5VedBmTNJeAdt/njcMnFkd@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq53iOjglbtnWFitH7wzOxGWGkashK0+Bk8ghhywOow9h93i77
	xlGG1RA04+WZbdbcNjlO4mdSMdzexdKxuK+bQ95nNW6xn+TtxwiuksOQ7U1VBSUpURc/fj0uF+i
	J35F80EjgPQq2lGFqMWLkfbvgIUc9oRfIKxVpKm0ZHhPUQAFuZYwb4KG/A+bUpUMu
X-Gm-Gg: AZuq6aKOsNT868IIxtJCnxHqEYtiGg/SSNcdmq7pJzyG5ArD+sA4MhmZqfbFZCwpLEx
	sESxCI5pPBjmwc0TkC4JMq0ZwbRg5MgMPbxNSrEH/1YIcq/I0e0wfAUhtT7UFcFMA4ZOWpo7jdY
	5CdnnuJuyK9UbVub/lFOLPnO4PLQw24Mol7yV/h3pkYhry4XuD1sUGT5G9m3VkMu2p4wTxvqzPk
	OIl572W2e3JRFbopNRIEpEEU6G6z0ed3IEMgjGQxx+XYzi3LqTO2iUYlsZtvjm1sbvvvcJzMJDC
	q37U9VyDDBB+cif4Tyd5eIRUd9mxW41S6NjDKEQC/wK41N2ollg6VWKZR2GKAsEPCxZXeNSPg4a
	MTJkXaZ4rZ1CKf3DhLMGIahbl
X-Received: by 2002:a05:620a:29ce:b0:8c6:c0f6:afa8 with SMTP id af79cd13be357-8c70b85685dmr1015278685a.30.1769683313305;
        Thu, 29 Jan 2026 02:41:53 -0800 (PST)
X-Received: by 2002:a05:620a:29ce:b0:8c6:c0f6:afa8 with SMTP id af79cd13be357-8c70b85685dmr1015276785a.30.1769683312752;
        Thu, 29 Jan 2026 02:41:52 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132303fsm13615583f8f.36.2026.01.29.02.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:41:52 -0800 (PST)
Date: Thu, 29 Jan 2026 12:41:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Eliza Top
 Level Mode Multiplexer
Message-ID: <pdxrotmxjiebyj2gqx6buwupkydngxki6jgv4e6l6fmodzc5v2@yxky3civt3yz>
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
 <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
 <20260128-hot-camel-of-acumen-eef9f2@quoll>
 <aizrc6xysfwzygdsfeuc2raccq7efmwg5bn6v33t2de6ugvzgi@z3ipf3i25ulf>
 <dc0b7245-de95-4db7-bf8f-815ba60d7adf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc0b7245-de95-4db7-bf8f-815ba60d7adf@oss.qualcomm.com>
X-Proofpoint-GUID: Vi-gx-_J6Oy_ScrszQR1WPPUgynxVhE2
X-Proofpoint-ORIG-GUID: Vi-gx-_J6Oy_ScrszQR1WPPUgynxVhE2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3MCBTYWx0ZWRfX5B0rM+fvfYp+
 FdvngN5UUzOP89TD/Days/IZLDmjvL0UXvPh3JBg6ExEh1ttUqVdmeg/ImZtwoW5TT4kmMU4EqG
 cbKABrDb5Qmx4fWlu8vSjNDZCOn3v1wj/pRL8eVgyq9No4Xqs3661Y1Js9TVQe4l/Jhfm1IEc/y
 tTfXJKNnEVJhS6g+rJk0mpsQgtrDoeS+SDERskHlx4l4riR0Jfw1ZrhDWJzjcYaXXgj5wSOQ2iU
 dy3BG4kqF7F+peTzAzgH+rb/3/5NXe+jiVZG2c8cMjm0xj2JI+53BdFfENJhr9Zgje4MNVJOXja
 C8N3IKODJqKOfxQXKp7y/+lJ8W1bXNaEYRWf/qKUY60LFjbu4Pv5VrDDB1B/N9hkAN3kArhaasF
 aY7uQ7pFvlNhFJWOTGpMuw500xzJTIqsFqBA87sd/gBTGl1JNKaTQZcY1COc1rFTESidFsxemVM
 XYw7BoOUUGfX/KR36nw==
X-Authority-Analysis: v=2.4 cv=Cs6ys34D c=1 sm=1 tr=0 ts=697b3972 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ccfMCwPpft0q2rCTRJkA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31283-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 148A3AF1DF
X-Rspamd-Action: no action

On 26-01-29 11:34:07, Konrad Dybcio wrote:
> On 1/28/26 6:22 PM, Abel Vesa wrote:
> > On 26-01-28 12:38:32, Krzysztof Kozlowski wrote:
> >> On Tue, Jan 27, 2026 at 05:47:36PM +0200, Abel Vesa wrote:
> >>> Document the Top Level Mode Multiplexer on the Eliza Platform.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> 
> [...]
> 
> >>> +
> >>> +  gpio-line-names:
> >>> +    maxItems: 185
> >>
> >> 186, your first GPIO is 0 and last is 185.
> > 
> > Actually it is 0 through 184. The 185 is ufs reset.
> 
> The UFS reset also happens to be a GPIO..

So the gpio-line-names should include the ufs reset,
but the pattern not.

Will fix accordingly.

Thanks.

