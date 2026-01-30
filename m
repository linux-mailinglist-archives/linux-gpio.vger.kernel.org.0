Return-Path: <linux-gpio+bounces-31333-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IZ8DhfqfGlTPQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31333-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 18:27:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F105BD184
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 18:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B4063015B98
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 17:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C403563F9;
	Fri, 30 Jan 2026 17:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9Hoh22a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XToe7r8t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321E52E06E6
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 17:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769793550; cv=none; b=S+TYzcNeccXDKiIwyuZdr0Z521X2gK+6wOgzev+oUQPCf4Vm523gZmEoe+0xejE3xgI1sfpKfjVZATTnGRxe8iUmQuS+zSSQPuaOOp9rD+SmfI1t4y4u7iIB3LJNXU0p0WU5Q2slt+3JUqdqOCP8cVTsq1z4T+jwmWFeT2nhdDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769793550; c=relaxed/simple;
	bh=1R63fYpeNRrONt24/anJeCtsI0gHzdbbnVVd8o7kIzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dOpJ3c8TSdp8xNxIPdKceFJu3DH1lNpY5/NdA8Jx+FJmf6euwuZnq6H5IWH7/o9Z5B6lvYmefUJIsmFGI+b7tZWjXVEjM9IKh7jloBT3WUUkhZRIQ1aUrgFcHhdNLOFszLtaNoEsBsyq58yiJgpGW1equ0ECrumSNe4uOVTSymQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9Hoh22a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XToe7r8t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U9V2sF2675459
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 17:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ET0iy5VonJW3nk40k4OAMyurOEyZOSvBNxsvAlgadk8=; b=K9Hoh22ash4TkDo7
	Ve95NvBzMeRSCobPEZOMvBPq8jtE9kMnOExkItkyOyHSBlyqpFG9xUyX089dZQ5C
	V3bxgaEEatnny4hnczJnXZbZVF/9XRnT+t4ytb8BBtquUAGVQnz/BntgBduP+F+1
	q6RiWvDGalBenAErChViP/hqhCrBTvwlw32kzRs7+Qub8U0sdYOEKc9rhyHJkbRG
	WgVeZAmS4r+tKAe5KxokSigZG7Yc2IeUKYnSsKkBXpKlTPYNAd5qRICNCu1nmjnw
	F4MJTfvsfoxZ19e9XwDkGYRfHaTW3fiJbatdYXXoLLFh47R8NcuotWhn7IYnClO7
	3i3WoQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0t341e5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 17:19:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c882774f0dso412043385a.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 09:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769793547; x=1770398347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ET0iy5VonJW3nk40k4OAMyurOEyZOSvBNxsvAlgadk8=;
        b=XToe7r8ttpyvaCc+bJC1eNcnKO1HG+VkcXL4ImxMKEo9GmF0zK+YY2ttFrzb4PP8p2
         kkjlrCVJtTGEZwNh8oOZQaWkgw8LHNmEK7JfCd1il/FYSazOfZAMSTLjHQ+ffq6Jm8fL
         pRoxc/8AfERdZsvRDvnUx+yK1Ol3A7ZLuebWx85R1/GMrEYE5KEqC7OoOjrVqK7YEtNp
         Bfd3Py79gcFWFZZlNbYBZ2yxcDDhNCGPU7xFOQFZgw/GusrC+9T2wqcxZKwTP5NlJFi0
         qLOZnFZvO+ODrjjj3XmRxYwNvfWxkelARpg/3Oi+7N17qGx5Cw4zqzp2qxXoc8VsXydD
         MKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769793547; x=1770398347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ET0iy5VonJW3nk40k4OAMyurOEyZOSvBNxsvAlgadk8=;
        b=eMvqZOiJGVN/SCMuy1DuSP3np51t3q2WUfrudRm7xJMe8S0SdabTccwCAphsC0xSg0
         7/Ims44FcM5R0cqrm+/j2KvteYRbaSBJJ3GBA4mpfxJjidZ2PkFFD2wi3rHUxPWidnZP
         wdoyQztufgO9L+pByV5/u/vVOwdwgvIqbtbSHBaq0MHueWEQ2PY8vQQL9e08+3cwqFIz
         ElzwoCsS43zf3a4sJv4wcHcMDR0qDehUcCIu4fbqAlId0lLhBQFKbzqkJwQyxbRfZp//
         B7LrLHl4Gt27ZD+u32RdcmaskTk8GbyFaN+zUu3UyEoPCiSv6MXasupLCKMF8+NTp6iS
         o8iw==
X-Gm-Message-State: AOJu0Ywi+i1kpEuBYDkl3ruAaNrvzSzxd7CDp/ONLOciCGoDjOPKoz00
	rcZXFGB8n5CsDD8eTnGwXMoHvv3p4aUWahDxHM+vqudtF7E4yyTx/GOwvvAbF1VW2j2l65tNjLy
	yBL3QsML0ykjGuEGSy60nrS4iOjb6zbocM5I4eYGzvahbXn4ncVM590zsR6Zir7723wz+OV37
X-Gm-Gg: AZuq6aLWhI6EkvKj1Xk9t4z/suRaW/BI861BiQLJVlfw1LXtEELhGjeZcGFGefAWx6/
	VGrtgAgxzwEOKr2hY/5zd7drQlK33jE7vR6Zf57wl9+OyPtX+H6i9wQxwimn4U0Mz8xcBIcG8Ga
	WbYXsh3GgCSscMi6XWdrlR6J66YgETvEz5VhUkIH+6Rk5qg+z3s+/N8TckpVRbZvot1UeuvUDDa
	O/6TgkuzICdkSuXkNPWDe6CIX1cze2H4B+hIUBulNidLcdk1YNF4LsvGtoZlwZ2qiVlKTN96Y2h
	YdD16/PFvh6SV40gIMf3VhghSWNgz2zagokSIOGa4BHx9rchQPe3SOCf0TyFELDUSpDjGBod6Bw
	mgvlmCOyyVbVdk2QzRy32msAMmQQA75kU/4NdqGw=
X-Received: by 2002:a05:620a:1a8d:b0:8c7:9e6:3a7a with SMTP id af79cd13be357-8c9eb12d476mr471443985a.0.1769793547195;
        Fri, 30 Jan 2026 09:19:07 -0800 (PST)
X-Received: by 2002:a05:620a:1a8d:b0:8c7:9e6:3a7a with SMTP id af79cd13be357-8c9eb12d476mr471440085a.0.1769793546717;
        Fri, 30 Jan 2026 09:19:06 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:41f5:f6ee:696f:5c44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd79c7sm207893265e9.2.2026.01.30.09.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 09:19:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, shaarang.tyagi@gmail.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [libgpiod][PATCH v3] tools: gpiomon: add initial-state option
Date: Fri, 30 Jan 2026 18:19:02 +0100
Message-ID: <176979353838.176171.12767664740072267832.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260129163139.7102-1-shaarang.tyagi@gmail.com>
References: <20260129163139.7102-1-shaarang.tyagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE0MiBTYWx0ZWRfX8KlxAlTaVnSc
 oQrDmnPIymic/zleqX283swE2sOI1d60NOLFb6pjDaG+K34XWV45TYmip7auNGDdf6EHml1lB1E
 AGy4VR2+z5NvUTBkWqpZovUj+IKxStyYDreD+omrhd3C34cXal3JzZ1oyOsGZ2MMqa9qHVbmp/D
 KzR78ruUvgmIJZO+HlS5iYZFJyQkdsu+80bkp3ErIeWmhQg10MupBz9phkA31pYjO3UYexVFXcT
 7dedznJvDP6mSlTU1OWF5OOzA6dkp2l2zKWTU4gdGkT8Icl7wymqgNA4DjNHnz6patCTRJl1kxD
 nevBhwJyY0rqtFoi0Kk2yT/ren0eYbTqTAUyt2N893rj1DhBJBccR1Gj+Plf1FAyTvV7DKk2+Tx
 UorW+cWGFy7X0g9p+nfim/QoZGF8LhaToVYizD8FuwruhEV0zKeVVmml20avs0YfpjaOxrPG0si
 SGowWMXZSTIT7I+EN3g==
X-Proofpoint-ORIG-GUID: tmXGZhjAEkT74yDdhQhFRGenZ-blIvVP
X-Authority-Analysis: v=2.4 cv=QfFrf8bv c=1 sm=1 tr=0 ts=697ce80c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=hisBKEW0-_modjB4jokA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: tmXGZhjAEkT74yDdhQhFRGenZ-blIvVP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31333-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F105BD184
X-Rspamd-Action: no action


On Thu, 29 Jan 2026 22:01:39 +0530, shaarang.tyagi@gmail.com wrote:
> Add a gpiomon initial-state command line option to display
> initial line states, this is diplayed before waiting for events.
> And factoring out the gpioget line status printing code into tools-common.
> 
> 

Applied, thanks!

[1/1] tools: gpiomon: add initial-state option
      commit: caf0bff354c8b03eaf070404ccb833265d50c019

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

