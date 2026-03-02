Return-Path: <linux-gpio+bounces-32372-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APguKc1bpWlc+QUAu9opvQ
	(envelope-from <linux-gpio+bounces-32372-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:43:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBDF1D5B2C
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88164300CC3F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 09:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CA238F640;
	Mon,  2 Mar 2026 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fYj9KSB8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hMmaRSTv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B5537702A
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444563; cv=none; b=ZCyMuM82w+JTMBMiS/BvuTJ+P2n71opIwObCPwQc4UavRfiy2A/+YhyMV5JgZZICDvY0IPyn2yfUkUqZli+dL+m96U2HGlSWg1SstHVnQ8yYvD08hfQH1f08TTIezrfy7eNnOjNCptgxXuJ/+8+t5aur9HMQHPxEumKNKovSm0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444563; c=relaxed/simple;
	bh=0VBnYitgwdAUXIlU4l5MbTGLSOpKJByhT6Xr7hPCVDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=llShVOqe8NZNjWNsaqr9kchhbrnOuw+jXkFbUTt0Vc2zgGfBy6/a0zWqMaX9YEn6iZ2W8I35z4UGv6lSKR9Wehq9iR/fzwM27dXCEM167/nnyRdeUYA51cISD03H71N3xKhGzNrwpWbLkEpt9CXCQRocHoGuF0CRPE9oSFrLr40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYj9KSB8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMmaRSTv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229ErZb3630818
	for <linux-gpio@vger.kernel.org>; Mon, 2 Mar 2026 09:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W6jOJObGif+AjqE5JDhjeGjidEdY5Ro/frDr8d26S0E=; b=fYj9KSB87OeUp/bv
	+E63bflbXLsiYJsL3T1MyfNiM4h30Ablp0wDf1GWP1iRc69yVgvtxDUCbEXyRb/w
	mJ+PrfnUB5eS/1xzvTpz33E2sRfCfC2IBt0QoI9zg9x815i/ofUouDlu1PFchACL
	EE0+qECGftsbfQ/4ce8iJhQ0cgkF3N7UvGgtbaAFkkp1udJyj/RAhz1jQCeNd3DG
	0tgaHDTkLrrK/qr7+tJceYaBZWHXNqztRvBI/mdfgUbJTyoZ23pCryez3GxrmXuC
	TPZ+SX7/r1zFY58FObxVlr3pEOjeN9UQt79OY7XOAGRfLTVQz2AWjP2JT+k2vNaZ
	D1+qcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhr3ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 09:42:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb413d0002so3742949285a.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 01:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772444561; x=1773049361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6jOJObGif+AjqE5JDhjeGjidEdY5Ro/frDr8d26S0E=;
        b=hMmaRSTvQOQfMn7cnrEM8qok4QjsbGp9yPtOSzst7NjY8kwqvO/zd0S0zsuz6nUaCj
         IpUtS30jpuw/L3Ovc/9R0dwBhwfB/TAE3G5fRjzG545sNDIEfWAlF5AmTIZnbMtXEOAi
         gfJWY0f2KNCvKDQ4E8jcKSthQwA2ee4fc1aRRUZW3TdeRGZS4S/M2tByAQuMwaRQ/QZt
         FWMSWJTQSJrTN7BthjiRESlSTdMZ8HbbkVkAkBf5vEvfirO1u78tLspC9wX4i7JRrWf0
         5zsOuPs61eJVM4cMjlh5mSwJkfBhbWsWIHHpjrdFfACBM9RNJVXNZC0U2E8B7bdfIpET
         J7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444561; x=1773049361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W6jOJObGif+AjqE5JDhjeGjidEdY5Ro/frDr8d26S0E=;
        b=M9E+hunnk5qvNHp3zIoZqiaoGEhCwLX7Jj12lA4xpgG3OryXOfurK2e9TRIlJgc/SG
         GeA+gxzrY9PZhFQSkrjUDLiAW2AjHHRfP0SPIjN4OQ9krlJ+E3XFuZOeHVEXNteAULuT
         tQ5aAqmD46/ZA1YWV8rY8CrnpEUOduilk4aFny6AJgFmfqdCawH3Dc1aJhgmxAwqeOrQ
         jVDiNYZ0Ouf3Mibn7JSob3/LQWNZU2jbtQdds84hsEatyZ1JzjAZvUi9KY7ShPUVM4iD
         guJfhLFMwcq/rO1QQ73tVUMmAkNMueQRLNnxKb4+X/+amX2/C62S26TO0qzdd/yXZvpL
         el0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKwEHOeJ/39fADn2VDfSKWiwSG/s0kkW+WFdP1vK2uv1Z98X6gyqcEUqS99GPv5WJBUV5A5UMBkO5U@vger.kernel.org
X-Gm-Message-State: AOJu0YzxHFQFqxcMCGj/6n4UDGVs9sMnefOGc6ep7sb5LGPf3lVY2LwG
	780JPcM04T471u4ICJcS+rnt0xGtRkabv7oDgnF6vxFq/yYCV+NKCJTVRVfZ4aQ5v9U7e7WPOIl
	Om0or126Jbe6dRzqDsFFCPG9gsmmBj48nlxDDtsKvYW+GY4zTfljuKo0O2lCp3KlN
X-Gm-Gg: ATEYQzwYXtv3mBCVhaypDcV56bplgESL/dFDzD73mRRHqbFhc1b/JiqWw0Vpohcq0cj
	+3sMHWxVZlF37+O75CN+DoK6ElfbiMPrFCyd40i+g1kpTzVit482ssHPd9qCglKdtdmvOSJcxql
	opzay+ZV/DpJBaSDr+Ko9iUxICtFV/LsXgziCCG7HXmk+ZcL8fTQFaWHBG7tFlR809Say3Ntmmv
	8Cnlj9TMZ2qYB/Cuu0ZGrY8VYpJquYbxvXt64sR06AkByffW1hWxqAKux7iKmk8uzg5UFIqwbgZ
	8gofnredKphRgOHrK2Al7pzcv9G5bzP1O8vkVl8H46ILgcR4vDt3aEW9I4sqD0hvv8dGUjPSa2S
	bA0JPWva7RwoNckDWbuZZxOARIb5bSyQ1PT/Y1PDDgqpZx/AXnA==
X-Received: by 2002:a05:620a:f05:b0:8ca:370a:3ac4 with SMTP id af79cd13be357-8cbbf366b1amr1806677385a.12.1772444560643;
        Mon, 02 Mar 2026 01:42:40 -0800 (PST)
X-Received: by 2002:a05:620a:f05:b0:8ca:370a:3ac4 with SMTP id af79cd13be357-8cbbf366b1amr1806675985a.12.1772444560194;
        Mon, 02 Mar 2026 01:42:40 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:31b0:507f:9cb:f026])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c35910f1sm228176655e9.2.2026.03.02.01.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:42:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: nomadik: repair some kernel-doc comments
Date: Mon,  2 Mar 2026 10:42:37 +0100
Message-ID: <177244450137.15436.4249127441499124623.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260301014811.3133250-1-rdunlap@infradead.org>
References: <20260301014811.3133250-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YYgfZlso_ERfxsUsUG307--qOPJOKIJF
X-Proofpoint-GUID: YYgfZlso_ERfxsUsUG307--qOPJOKIJF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4MCBTYWx0ZWRfXzlM6u+7zVCep
 GheS8VDkoNCU0YIczRp07y0Pbz5ilIOz1fdzE5mqlDUHDZzEIAgcK3JtRHLVCBEwHQ+27ruOXvv
 d/oKBArwYFQId5ekBVskda5pVvLCW4qi+9rM5+t6UNj1pMEtUtdRDn+WsUtzV/oeDVzxFR2DDN/
 rH2WReOYJo9K3cuufLjy0P2jAoxLDXDEv86C5Y4PipdAPiiomai21lIQTpVSE0UhHxktEKZ4Zyd
 BpI9ZO29XfBJlha5A0NgyN8mLK0ETPcNyz0j6VpbnhzO7WW9t8RWRsR611jK/I0mRLrz1MoR+u8
 EbNNB7eBw2UFHqkvGh7JJV7o6/ELjlDPi1NGJSmj8pE4A+8oW2NduUnOcmN60HAR0geQZIEN9no
 voG61HjoAc+mGuRdRkBF3sa3gEIFfLtd/m6Cudvp5AWa6LiBzS7opN2CmRQE7pBC0i4mqYkRvjz
 unGZjrRkbvwFpYkzxmQ==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a55b91 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VXDCgYNSHkTYBlPD57wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32372-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDBDF1D5B2C
X-Rspamd-Action: no action


On Sat, 28 Feb 2026 17:48:11 -0800, Randy Dunlap wrote:
> Avoid these kernel-doc warnings by:
> - adding short descriptions for enums
> - using correct (matching) struct names in kernel-doc short descriptions
> - using the correct struct member name for @nfunctions
> 
> Warning: include/linux/gpio/gpio-nomadik.h:116 missing initial short
>  description on line: * enum prcm_gpiocr_reg_index
> Warning: include/linux/gpio/gpio-nomadik.h:125 missing initial short
>  description on line: * enum prcm_gpiocr_altcx_index
> Warning: include/linux/gpio/gpio-nomadik.h:146 expecting prototype for
>  struct prcm_gpio_altcx. Prototype was for struct prcm_gpiocr_altcx instead
> Warning: include/linux/gpio/gpio-nomadik.h:156 expecting prototype for
>  struct prcm_gpio_altcx_pin_desc. Prototype was for
>  struct prcm_gpiocr_altcx_pin_desc instead
> Warning: include/linux/gpio/gpio-nomadik.h:212 struct member 'nfunctions'
>  not described in 'nmk_pinctrl_soc_data'
> 
> [...]

Randy: please use scripts/get_maintainer.pl or b4. I don't always go through
all the patches on the mailing list - I expect to be Cc'ed explicitly.

Queued for fixes.

[1/1] gpio: nomadik: repair some kernel-doc comments
      https://git.kernel.org/brgl/c/189645ba9cd9c1eed45151aacaae4347c1eb86a7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

