Return-Path: <linux-gpio+bounces-34776-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OkzJAbi1GnbyQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34776-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:52:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 171623AD456
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 12:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB240308CACF
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 10:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1443A75B5;
	Tue,  7 Apr 2026 10:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWWXkLGC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYB7zFzY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E8F39D6F9
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558808; cv=none; b=YA7hpFYB9PYG307ftaIvFASBHaC9DoKV7guDjk7OuQxXfZUO674tFSFbpTW2Ghku3zlmzM9lTeBbtJrTcYsspCpyK9oOzDsbix8LTeZUUqKUkCZgJ8jY8zdGAPgQAoRJWdmVewBCszn7ifjq/Bym4+xx4KtFmNt/0K6WZAEBxDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558808; c=relaxed/simple;
	bh=x9nUD+hNQ5bEMGTetpudV4lTB5TpU0zilZumzdWvd9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrhv8Qf/P/+D3wTVLoZnPc6JjcblI9lBPu+pwdW5n8ieCKDc6IiXzr+TyooLnZaEFBRM4loRDRekdrPuLnpkz6VRtjYEizBijIl52EbVCnrjbThGeIu90hvT1raPEAPDOETPlm8DPiMLYmT0mLwf+mnF3VciWhHS1DIvMBl1Lik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWWXkLGC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYB7zFzY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63772Ewi4009149
	for <linux-gpio@vger.kernel.org>; Tue, 7 Apr 2026 10:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ovv3xUR68mHIgFCgYKLFv+yIQG1IewaGYjv41OKvUbg=; b=MWWXkLGC2wj8hAli
	FGNann58B9eXEwG1lIm1UweSdTNdKUEzQK0cB+en3pcjl0v6tCzZl8K7Tkyyvy1n
	KoEkdM0xEpzr3lgfOhu1YqH6pXFp0Bbmh85tY8tSO6Np8amkIcsE1Su02UocXPih
	dj7OrDjOYOptdRh8TCqshzqSJKYu26Za0o3PPdKA3/YxVHelrmaO8CLQacFAZ6tI
	zuU4Nu56Hl14ZvynTQC8dQjL4RpAUyqp8bzyb7VKRXDnse1qWwpN/OiJ1dnFF5jq
	pQggZll6hOkz5POE7q7Tf+ofLnm25kJcBa1vGXHIZVBOPIwcX40/g25gbNXXW1Ef
	LMgmhA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrktae7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 10:46:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b31cff27fso43601411cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 03:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558806; x=1776163606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ovv3xUR68mHIgFCgYKLFv+yIQG1IewaGYjv41OKvUbg=;
        b=eYB7zFzYtOitsnAZvJrfV6vBTgKfTTpxCmMgJPId53Vxt2K0jCGrgFSjga14G01G3G
         UQd5KTYcg5TLxr8MfCYYqrLKZN/ij9jzUJqzYLldqml6CLc1SxpKHYzG3AET4TJqdgwv
         cNUDy3/gtkQ1nx/hR531AGO2wRdUYRzBtalORVIYFqKyTPt5uVc2P2tI+SymurEV/JsQ
         E3PB3tKkyaTNfmg8CiWIBfe8cvOhScZlAb4lzjDu+sv9DcqsVpix0jn5oBPSRtyEvAKg
         qct5wYS04c/HrVC7DOn9VThpcM3IHT8Zrl6lyfuY6/ybMghSgJ4D9UeCzKSSwVo5lCZQ
         oxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558806; x=1776163606;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ovv3xUR68mHIgFCgYKLFv+yIQG1IewaGYjv41OKvUbg=;
        b=dB6O8MkKojP5JWRm0gvrJR7gJpebLqH0oQRurCrYWy4nje/tuIDinviZw3uyT447+F
         hgYb8nZJD3qWEWYpql0ABBnBj3YIkQvaqfjPgz0QJIghQDXrqWc2Mk2L07htkvTpZ4D4
         lYQvxCe6prL5pFjJBqM6Z2yl52xV7c+qJPejuwew2ZgrgHo9cfM3yQW4VFe6KJbbNzG9
         ADl86P7FEKXAfCrKvq4Lex4cQjgWZdUNZeoCdZUzugWvsbVt6QxDTiTvGuUA+Z9cThVV
         4Fe+Cn9pF5BfdokrhzgjE100kML0OBf81DUbPP7RXnCqg1jMn3TkEKqGhSHYBBpmCTTT
         4CHw==
X-Forwarded-Encrypted: i=1; AJvYcCVBzHIz28M7tKsBpCYJG6gu190TMeyJ6UiPba1gP6rYAfIYlGI7h0ZVOjRtS70VNUpLF1Pc4mNWzn+1@vger.kernel.org
X-Gm-Message-State: AOJu0YwnIYU7KI4oxjJFTOM5/gBJ92WMcD+lEIlGW5mnVlGZKyeYK0g0
	Bm6MXkpqfD68L7JqHhmZVIa+l4e4kR4/XK5pMCCnsvdxz2/HuLVMkH9nT9HL1oBXgmZ4DkffCCz
	YO3cqIqo7/5xOIRzwfYRFnUMKPSfzE8mA7TnvxUFvvHqwdtq8yXiKiA4oBJNjg935
X-Gm-Gg: AeBDies5DyEtbfnSR+VRDPsccVFbT1LRk2w3DMmEvdiuAOZLCJWo5TjEOzEe85C4QDj
	iEFadWYPsoY6FQnR6WgehFD+vcjRgDTNAxg+Roy+tBkQEXMxZ9QFsSFhQk05h5GtXmeSsFPFc6C
	GdtwZT4Q5SQhTFM+LdZOkyw72IrKhY1X4ByVRigALk9D69JaeU3cTlCRUzmgWySvwQMz9dfuEyQ
	uCkwTRnvI94RxfAeOfnep549Z6lWfu2xlywJzWvCsahFW2KxlM9CUiFiYGJEGsW6jA3QP0xsS1p
	GHcC4uqQqk8IF295roDxotFkKg+Vj/i8D4xa7b6n6axVmKRXVQ50GLcd26on1l25uLdv/4xfaYQ
	7fVqxAPc0CFDne6TU1aLG0nQN9hJHvKexA9xgNrkzcdQoAQCB
X-Received: by 2002:a05:622a:820a:b0:50d:aa29:2b64 with SMTP id d75a77b69052e-50daa293e50mr7228811cf.33.1775558805705;
        Tue, 07 Apr 2026 03:46:45 -0700 (PDT)
X-Received: by 2002:a05:622a:820a:b0:50d:aa29:2b64 with SMTP id d75a77b69052e-50daa293e50mr7228311cf.33.1775558805195;
        Tue, 07 Apr 2026 03:46:45 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm47139435f8f.30.2026.04.07.03.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:46:44 -0700 (PDT)
Message-ID: <86922e1a-b08f-4320-b397-0e6985cf56af@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:46:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] dt-bindings: display/panel: jadard,jd9365da-h3:
 describe Waveshare panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-3-5e9119b5a014@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260401-waveshare-dsi-touch-v1-3-5e9119b5a014@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4e096 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=R9HfFlAMdinP4lNXC0UA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: kHVSa0HccbFLbW0fV0WWky4w9llfFwCE
X-Proofpoint-GUID: kHVSa0HccbFLbW0fV0WWky4w9llfFwCE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwMCBTYWx0ZWRfX3DEirQmftVTE
 xa1AqrIMIJYG0aoqJ55cNM+1W/gRb3yHDJz1QjoqdRaSxYenrA5HlhhrPMN4Yud0m2rEyewmZxS
 xMRCJwe5XpQwjf/h7v4k+f0LywVrjEBVvEokSd4ppKvFQqY+a3B66S+1JhvrBQE28gth1f/P2Kp
 Dee0Oup8JshBNs1tBSITStE6r9cfuJYrir5UDf7eAn7YYfjh50L4qOXy6pxmC5/L0VwCTsKyXdj
 +SgHttYtOeWTNTZnEGh42YfOwrkmsM0Ywo3u8SjSmxnr86xINk63RL0foZYwXuddfHZSFK5a7W1
 PlVfH0ztqHCps3wdT6+04EHWb2wG4+zjVxAUUyF591+gxbhgv4z96/e3Kc2sltIyqJKcTgSjFJc
 c/fRPSK6CBSyQIIMkts16tbueCc6H3DYWPy7hKTjQ2sG68XtuZGVatLI0KPBfCtUSbNt1x1uVZ5
 GsLr16qwnfCQ7r090JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070100
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34776-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 171623AD456
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/04/2026 09:26, Dmitry Baryshkov wrote:
> Describe Waveshare DSI panels which use JD9365 as a panel controller.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


