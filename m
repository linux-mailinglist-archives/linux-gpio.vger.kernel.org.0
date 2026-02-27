Return-Path: <linux-gpio+bounces-32266-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL53EA1foWmksQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32266-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:08:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A64461B4EB7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 10:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B7093013A63
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 09:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AD83AE703;
	Fri, 27 Feb 2026 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="APG4kawT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MRm8Fiba"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C97C3A0EA1
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772183306; cv=none; b=E5nwg/q+237tg+cCOzQEdpbOXqIZBbz65Tq7O7c+V0bD5ly1xWKdMIGZ6s5cvmV/6DB1PIXIu8tx73Uo5vlivCs7aea84QICluz9DO+c3vS4IkVHFWY8Vvx4l+xeN7dN/C8FfDubJNa33L0YSUow70W63kSNKXvrDRAiF3/U+Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772183306; c=relaxed/simple;
	bh=rmLR/Pedi1VzC81+2A9Zm2lyAKg0LpV1qkJq0RoPXMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nlHnClslDDbZ3axwIVmfwnUpqjlSZSUr57Z15aiXOCebd12S5I/IsAJKzVUfn8f7layoY7UeiSoOGeDzo93FA305r3Md17U1CWA6f/RN8N0+oq8tigp5ETsfiC4/SIaFJEIfSfWsf7S6RXTGU92nrjqgedooWPbdMfFawiuQUB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=APG4kawT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRm8Fiba; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R4H44l2663858
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 09:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hvb99L1Q0bbxUi8YbQtiYmhnZuG1GAtAwFPHS9tB7fY=; b=APG4kawTZWNM4l6F
	dGkvJjg+2OV5WtCZoNLXx2BP9LcP1JCMV+Ztx1bSyo57L+UT5WBqD8wBy9AydRxe
	DS7sWluxR5OEPna3WsXeB2wJn6ITuLTv5nXIv3G4JfPdx3Bef1uVOKceRZ1qb0Fq
	cCHzYcDWnvs0UeZTymXZHpaQJAPrFeNFbHU0TRo5lrTHPgZEPuHI4pwC9qbdwkYK
	87DtQScpZBQaRCuV259zpDi/P9hVW3T2rxsIiHwuSw5F64H8xJEzWtNQK/BwoacG
	L014Ybrf2Tajr71mIa/RjaY5eMiwXgJ15C5+gq7eY2U+gjWaDvFvDWdfdJv17bQf
	CfCkzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck43r8uur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 09:08:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb413d0002so1494010285a.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 01:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772183303; x=1772788103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hvb99L1Q0bbxUi8YbQtiYmhnZuG1GAtAwFPHS9tB7fY=;
        b=MRm8FibaHFb6Pazt1uGf0BT6TdOmAiHHK66mxGC2+lfR0CarPmLcjUScKHHVrsXF/f
         lAm8MU3LL93aX2+MK0/+G9RTomTAv+CgRdO5yNwy1dn4ag/q9gi3egFfcDr3T1f/C2e9
         8Y51ouaPIFRjXAq7XE0BCO3S/JCgrUJo4sWlyb5RrPwahXLafanc/gITVo7VxJ5f9DKl
         FH8/OMdYZqAziaPNFwen/h8vASD6EZ/h1/443UF24vOoMPGtT7fYpzWy/eoUqFJL9u7M
         ArI8TmMFPmhsJtxeHT0Q0k1VSxMCAuhfQSQx88i89IyG3t/G9ytdEGXmy83IvMwUppYD
         dPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772183303; x=1772788103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hvb99L1Q0bbxUi8YbQtiYmhnZuG1GAtAwFPHS9tB7fY=;
        b=nlWbjXxb+ImARdwJJm3Na6CthnamzWRZ/RtL5r3FH91MAIopRz6O2zp5AUoeF41kSv
         vbw9PMBXDuWjbtg44mJCnnmjNMZNYXW6JkV8s/XHnYIi12YYkb3MmeZCBAJ5QZ4LGQTI
         xO9xAhZFlXX3sxekFYDqAsWWbaBAdmpRY4X9D66Pq3W4vha4CL5J2SynF9LBd7RVeg50
         2UZIltJY0W1otO1X6rtJkY8C3ZCSLwlSPcA7Kl8EqOOgoWCAN/8L7gRDReVsRtY/XS/P
         d0OK8TbsimJZs/ELip0m0ZSwuhlauGaROIt5o2caoFgtE4kFVj4++ZPpdRnRufUSV4Lq
         g6yw==
X-Forwarded-Encrypted: i=1; AJvYcCVMxKYTUaPcaK7Jv8eKCHVto3pf4aMRouv+PjqK/cQFJR3Q9r1HJAWaLkfSXOIQHveclukLtoLb7GG0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5RWSKKe0V8wVNbJmqC8gNEpbNwE3b13xZ9VUnen6x3hbpptHC
	VxpMyKBCY5ZIGwY/ndp3JwFko//VeUT2PBTPuWmv2UCcS8lO+dC9gf4gsRHUljlML1nHMfdmNGd
	78pfz1T30O+fyQVBV5idDzcT7NPxgJK55L65DkilaWq+OOhAXmJ9KLkrF+ZJWGyci
X-Gm-Gg: ATEYQzwVFKXF6id3/1qb51bXwR/f24OG+8hfTqCbf14lq3rb6rAPSfobhJFaaX9+YZn
	AiNsoXWXY3yPDdpZLn3Nf60suPzS+R1XSO2kafS65G8DMaHlUzfQ1py0a9VX3kMAxYI2joj14US
	TY5oAkPNzMO2Gnb2Q1PrHtRvkaNZZKyU3yLC/1EMR9HOZrAJ+XdFrsiX8cLgkbdAEGW5ixKHPrG
	kqHb3SJnoZkp1dQUkpoJ4Pk9BCQFpKNRP+lDHMoVlEpFl340zWqgBuurT2/hdTkSOpIRCg9PhKh
	s7AXL8f/W4Ue3SV1aYJm4GIPeNDS+2pLad5q72jK7+WXT+cya+q0E+bep9Co6vLK4pqWQcvo0qu
	Rr2xPnnSDyirNG9bLfeUQ1e9vE4iaz5zmSD9XIVy9hUXiIvBQE+M=
X-Received: by 2002:a05:620a:254e:b0:8c8:e139:b08e with SMTP id af79cd13be357-8cbbf3f3792mr693890885a.33.1772183303248;
        Fri, 27 Feb 2026 01:08:23 -0800 (PST)
X-Received: by 2002:a05:620a:254e:b0:8c8:e139:b08e with SMTP id af79cd13be357-8cbbf3f3792mr693887585a.33.1772183302764;
        Fri, 27 Feb 2026 01:08:22 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8bcf:177b:d085:ed57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c763e78sm5640945f8f.26.2026.02.27.01.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 01:08:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3] gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()
Date: Fri, 27 Feb 2026 10:08:19 +0100
Message-ID: <177218313069.8853.3389428325341696673.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205092840.2574840-1-tzungbi@kernel.org>
References: <20260205092840.2574840-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y776BrbyKuLqQO-XT_gfQlgIOsneWgMn
X-Proofpoint-GUID: y776BrbyKuLqQO-XT_gfQlgIOsneWgMn
X-Authority-Analysis: v=2.4 cv=DOqCIiNb c=1 sm=1 tr=0 ts=69a15f08 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qoPWTQsIWzZwHgpNMdEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA3OCBTYWx0ZWRfX7Pygs+lm2f5G
 h4Q4bQth1u9XPdAJHA9hJIXsX1OFFVasZL9V8vUGlifdX+KpF0Wn51Yw9QOWzPgeKAjRH4ce60H
 6JWxrQHr7xOLis8fujZHeCj6+/kEgeWg4yduBpl6Q6Zc1+2/zFP+6cVcj19o5CyEPPr/hesJwZg
 EJpvgAO7w7U6cK6VWQAZljfLz/j9C/ev+PNNOLckrol8TRUBZqwkzabq1fNowBuLUkKiYhKi34i
 OBUg3O/HHjvHuBM+zEKIygZ4xB2zA+AB8aboJI7l7hO7BKUjjZOB7srfj75CDSu2T8h9hgJ0eQZ
 03RiBBmRDqzpm63IYyRL9Vxlpf7AzhBoZpbz+HcDQQIKCHLQ2EMYtefgfgUp/5Qj9FYQwSF5A1u
 T6IxgjcZwfqcF+WJ6hY5xiM5k1dUBgBkpIAHPeAqVNnbp5BWuYFgpDwhD2+FTv0f50Ze3Bmepqo
 z+UXVkUD6pOaYFY+kJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32266-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A64461B4EB7
X-Rspamd-Action: no action


On Thu, 05 Feb 2026 09:28:40 +0000, Tzung-Bi Shih wrote:
> Since commit aab5c6f20023 ("gpio: set device type for GPIO chips"),
> `gdev->dev.release` is unset.  As a result, the reference count to
> `gdev->dev` isn't dropped on the error handling paths.
> 
> Drop the reference on errors.
> 
> Also reorder the instructions to make the error handling simpler.
> Now gpiochip_add_data_with_key() roughly looks like:
> 
> [...]

Hi Tzung-Bi!

For now I queued this for v7.1. I want it to spend some time in linux-next as
I think it's a high-risk change. However, I preemptively put it into an
immutable branch - if all is good for three weeks or so, I'll send it upstream
for v7.0.

I see you added a Fixes tag dating back to 2024 and Cc'ed stable. I'm afraid
this change will not apply very far back, do you plan to backport it all the
way to v6.8?

[1/1] gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()
      https://git.kernel.org/brgl/c/16fdabe143fce2cbf89139677728e17e21b46c28

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

