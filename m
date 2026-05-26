Return-Path: <linux-gpio+bounces-37500-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJHvGoFgFWoiUwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37500-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:57:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE6C5D2D15
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 10:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98C503025C66
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 08:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6093CF696;
	Tue, 26 May 2026 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0+HbphA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W3jbMqN7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A0C39C63E
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785774; cv=none; b=KeA1RPq/N6aRonDmB9s3cK5oILKj4kdT3wH+HwF64nWoWM8JHmZ9g9oyZeYHBLgueENTj8whVGxtERyw+FHvYv56qWwF0Zhqe6prn8hh3Y6dhrEJRmQVoSVgkiaS+YMPLcmYj+tjhRuF0qhdnEtXGFRz7VSSSIML6jnYwjoF4do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785774; c=relaxed/simple;
	bh=1ap6y8o9oyVcdCWwsAbS0cTcNPtt3eHvQyoqxGjazcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i5Uk31Ss+z8b9C0LEHlU1K5JB8tNYARcKZU/gYRKYGytp4POMJjiGeJjsk15I4W+hCBmLkG+EZgBpy1sitLNlo/QwDVAx7mBLFv0NWf58yyVjRVQ3iqFsQEoKn0vQ9KFwMe2rL+HsCJUpOzjzUamGSsuxPs+sCgRRWB0EOlJ1nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0+HbphA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W3jbMqN7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q60kEB1763808
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZfBFuM2BQGha1qkVK1SHFkDMe0t+0JXX5ZiL7JYSC10=; b=a0+HbphAgysNZnM2
	rAGmv/YmaR8zR5JxsoFrNXrZxFWXITqYaoHB9q4IAtuJCbTDmrpZ33xkkvt1gP6g
	kTnML9rFqzD7jnINGq/6Yzinbl8LpM+F1JQ2B1RO+GwnIhZtxAK1WdgxI20Tikis
	pHCPE8UkoTPaX6IKMA2tZsn24RcOhfcHHrpiIBa5hU1pyW7PnfPnHxOwkyp5lmuT
	q1evMwHHWc2TfJTmhU5oRSK6XDOwK2bHlQjJ6W0qaZ2DOq3Xb3oFAR8wT/kzC8SX
	+VDHPS0vZZgY5oyyUIcjjCMdVavf164/fEhPJZu7xQrgc+M+V3L0RD3Ik5ZX63qb
	bR1Ujg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vggpqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 08:56:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3403e99so41043211cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2026 01:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779785770; x=1780390570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfBFuM2BQGha1qkVK1SHFkDMe0t+0JXX5ZiL7JYSC10=;
        b=W3jbMqN77EMexwdhD5Pmn+Z6Fixhu15z0HL1QSGuJVgh0vpx8roeD4SK9ePGXoE1Y6
         dLvV0SxhUeohul7PiVgIF3ctIDVUggItFRVHUaV4EMFkHEopL8AypuQiBKL8fTReLuNd
         nr41iN3AKbdaaoN4w+MmpyU5U+761yTwGnC/KKtshZQ782rzyY4mOt05Cr7xu2NBkMK+
         EcXKDVJIuLkcO00SdrInziSL5BFazXPh51Mu/OB74Wc+dQaPlMDQM+tDbPHusQw6oDsF
         Y80HlMo27p9KU67HHlnLe5FgxDSVKctE02mJ6qF5LGfDjqcJMTEq/umURLHUCQFuEHnS
         WwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779785770; x=1780390570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZfBFuM2BQGha1qkVK1SHFkDMe0t+0JXX5ZiL7JYSC10=;
        b=FRDhEIOWDicNqq5Xk8ER2NO3N9Nh7L08y9rsNvfShIoh6w5igpV/Jffyqor4ahkqF1
         0xxVydXDa3TdjkL/OC9XeUTerI34NuE8Tf+h8ty5fxUIAE+qoJBji2k//gSNktHrHZA1
         DWoNAbrz0jlNfvo7Txo35N4OLftMEfQXM4ErN1XDmKm8YdX4TWtC2MhtuoSQa31aoLx8
         0qMIH+5Ic/b1m6P/bROmtb9nWekviYRqIs4UXRFaULjOu9td0niZbNd8YAXpctU/Y08e
         5stpqMezhyJlDODjmiq9F4x7V9AZI8uxaU7vlYTP+W1rMqTSZzvPIVFQgV1vmEVUqkSr
         QrFg==
X-Forwarded-Encrypted: i=1; AFNElJ+3N/zb3T7WMNFkfBa0Z4m/Kxqkk3r4vn2n2ep9nFIY/V2+MdaXWks3BgPWfjqUlzRgCWr1xnQ9rpgS@vger.kernel.org
X-Gm-Message-State: AOJu0YwA3u0U7EEtDhKHuAhRPLvkfsgJdai/TC/VJlxvZlXiuefsCmnH
	b6JAdg87bqmI4dF1m1A7DWH8m3Z0/9U1WCk50qWxLIDPZa1MCpwm3bhz1ekYav1UaFxrsgcNHjv
	pbfiKTFH9spYSd527VOYQFdV/Fk43u+RJoN4jI8k1kHrsBfx+7Hoo1u34G2x6K0awt2lRUVna
X-Gm-Gg: Acq92OHg/v03jNIP42uYk1yY2bvPLhIDlbsCuo2xHUdM2H5lWEtP+RmedEsZIY4KpzF
	JSmWytHizFdUw0D/bWxuTYltZ3h9n61WK7eAU984Z4pjMz51x/45iuXaXiYI9IEbG6Fr/OctwHc
	uB3cpIQPMIhQl7YREoA1TPhvOfbivxhFtMPlfO4F2jA4BzW49vV0bDZGWmOE7h200LeFQgOVFVU
	kgM52TPvJNZLe4HE2iD0ALntqryGu/SCyl12oW8FW6mN0Sq6MrkH1k1uc+RvE3LHlvcHpXgYOSO
	kZP8SQXpFUaAMkHBbP9Yx70iIfmT3t3J9cgtkDG57xGud9c0pmzgERpauX46k4O2KfO9Ufx7bJy
	IbvLKZ+GsHj6kXXtJHiMUQtHAVpyaqwEDPZPDR4eSEK7rtchaUA==
X-Received: by 2002:a05:622a:4887:b0:516:e033:f5ae with SMTP id d75a77b69052e-516e033f8cemr193795931cf.44.1779785770467;
        Tue, 26 May 2026 01:56:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4887:b0:516:e033:f5ae with SMTP id d75a77b69052e-516e033f8cemr193795751cf.44.1779785770034;
        Tue, 26 May 2026 01:56:10 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:77fb:9b68:d26a:48e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042ae1ec0sm104144275e9.26.2026.05.26.01.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:56:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Len Bao <len.bao@gmx.us>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Mark gpio_devt, gpiolib_initialized and gpio_stub_drv as __ro_after_init
Date: Tue, 26 May 2026 10:56:07 +0200
Message-ID: <177978576487.20055.12051910255098467917.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260516105737.45174-1-len.bao@gmx.us>
References: <20260516105737.45174-1-len.bao@gmx.us>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a15602a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=z3OEfAWllt80OVZftIUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 0893hPvyVTpxiHl0i975pMpOwyAGWNzx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3NyBTYWx0ZWRfXzrtEelU1OVHK
 9q+yKM9nfbBk+WfNKPl+FYMYkfzowUwb6ZMsxaHgG73i0uViLGCCZbIPBg7dFfkoYJspmAVAfwr
 LZE9Loji6iPIie1TXWTYzJnQJSrnhQ8Qz96fOE9rlHgHw2+h4AbN59jg0zm9S38tUWfMcIyx3K/
 qiBtOwqs8gDK222kLgkiOwvwRa8HacrCGp/LE8ciaabqZNUu/eo52u2jyAGMXxuUUuAcH++hJR1
 Bf1/0fvzgyNhvIKXI7jbVQRcbLNRQw7OVIUkf0NODgSUbKwVzeNNJOu5hYVOGtDeeuY33KSYrnJ
 bKpZCnJRxZ7Lx1pWrIq/8XOQ5E7YE9mca2a/KQByzahlrc9JDfsWKJw5nFHI/fOcsr107/Uk7lL
 DseXWchbwUmSCzwuwF7sCJsEvSD1LPEjt8poFLuqnEq7IOM6w1j+d1wt0YxOB6pU3sT5T8KL4vw
 /vFgvMD9hIP1s0tkPHQ==
X-Proofpoint-GUID: 0893hPvyVTpxiHl0i975pMpOwyAGWNzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37500-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmx.us];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBE6C5D2D15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sat, 16 May 2026 10:57:34 +0000, Len Bao wrote:
> The 'gpio_devt' and 'gpiolib_initialized' variables are initialized only
> during the init phase in the 'gpiolib_dev_init' function and never
> changed. So, mark these as __ro_after_init.
> 
> The 'gpio_stub_drv' variable is initialized only in the declaration and
> never changed. So, this variable could be 'const', but using the
> 'driver_register' and 'driver_unregister' functions discards the 'const'
> qualifier. Therefore, as an alternative, mark it as a __ro_after_init.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: Mark gpio_devt, gpiolib_initialized and gpio_stub_drv as __ro_after_init
      https://git.kernel.org/brgl/c/b12e12ee4138e30d786eda02223e87044c989bb1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

