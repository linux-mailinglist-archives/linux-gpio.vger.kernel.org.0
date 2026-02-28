Return-Path: <linux-gpio+bounces-32346-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCcpLoIBo2kJ8wQAu9opvQ
	(envelope-from <linux-gpio+bounces-32346-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 15:53:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 346C71C3B87
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 15:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 255FC30A0355
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 14:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE3F441046;
	Sat, 28 Feb 2026 14:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7PDDtLp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA36A43C062
	for <linux-gpio@vger.kernel.org>; Sat, 28 Feb 2026 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772290156; cv=none; b=Si6t/WbkeOMLpTw/8EIEoP7B7QXNM23C8GqznCLYs4bzbeBxDSBgA+p7swGywjRSfFM09pYB9z2rn8QoZ+NizA696ttZAPZtiirbFCjVKrKuZbIVHPhLNebHLOO6QwzEntfpHvEFL/4VWOuvfyN7mY55kffTGauCd3LN26QGapI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772290156; c=relaxed/simple;
	bh=+uRA7K5x7wmiyzbPbfgi95Zlg8sTfWdSYFCy+8VqmBc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bMylJXdx6+KPKE6Y6GbXTeO61EBKJVjrzIPpxNQ9C9/uoQzuuoVT4m8maDJMeyc7Zj8pHxYb2BwAYwJFw7WhNuh1Zf3vxWyO6BIIXoxEPQRmdv27A5lanPJBgwaYpXDZHx6IS88Nq/4ceCbCmHAVIiytnZMYg7sx0wQWr0fw1nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7PDDtLp; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79885f4a8ffso16702677b3.3
        for <linux-gpio@vger.kernel.org>; Sat, 28 Feb 2026 06:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772290154; x=1772894954; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uRA7K5x7wmiyzbPbfgi95Zlg8sTfWdSYFCy+8VqmBc=;
        b=U7PDDtLpxC4CxO6T26v6HEKQWP7xw50SU2/fYA794iTg345pltKsl79ozkn1iDk6+Z
         P6aRNy9y7OWoi4B7v8Ng5dZfOoIGT3ZxlkDGuxg2M/JoJbKJj7qFEMSStSacJu2KHmJ9
         JPTd2kfMD4RN599ZL0pgLOvEc2afRLvaM8bk/WAKRDbqPIyJUn/EWfVoVg5QXFgRfQOV
         rxz9Gu4wBr+ZHoG9nM7wzWjrrmUaiGD/t+4qjD6a7GtVBg0p8cEVDEYWp133bZHRsW25
         riC+9oxTW0UjUDXTpLSZWtVK0JK6wFcJ9Y3lX9YFLzVVpdXfF3ViN3OJcSA1M8INDikO
         oK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772290154; x=1772894954;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uRA7K5x7wmiyzbPbfgi95Zlg8sTfWdSYFCy+8VqmBc=;
        b=RomJCSxokJi+Q1xgIfESIhFHZLVKK4fsf9NYVbxBtVAQBhu2pJdSPm/lyIhigxrJEw
         6EMi57xmBYGm/gDZfE6w/e2EYJhkbt/yWcnQeakY995R08/3Eq567s06PYXAgYYbegkF
         lrrje2pMn1SzMLfuPBsMZy3y+5Et/Zt4rXVZS7vwX1NpgDYkj2c8pdiBr4yzOTqjojUQ
         ym5OJRoGOsFggFYjBJAoj0oRXOe7IRQ0gcx0UDWlBlZ64iOKhR7osESDj2zYor21ofbx
         QT7vONqhQA+qXz28l0NUae6NoLnbzoa7zwSMRhkF5pOLtzJfun7YuNSmn9j55VLcvsey
         TFiA==
X-Forwarded-Encrypted: i=1; AJvYcCVrkTfOPUA2q4V+9ds6HmaNDGvg0HQVceiLV0Zqm690uav85ID/XsvAmXW7NIMZDs4STCl+00VPVPH+@vger.kernel.org
X-Gm-Message-State: AOJu0YxI0xrWcnIfFiUZ6OsEmsfd1xfGXfcW7J2lwVAar+eR8hekb9UE
	IjZWvLyVWta3nfiyT3PqWzOGlGHyesAuedxQGuitThbAXwASCeswkpv6
X-Gm-Gg: ATEYQzzUvPmzh4V7vpXbasj1JK/kzM4/qXLdZhNVW2hnvtLvaJW4/Q0fGKrvqCuwBH3
	zIr6sC5iJWhsh4zSB4T9I4dVs9+Ye+Y+QOacroqTkGJgYGsbGWWrmoSRZjXdMURjmlUmGXnOXbn
	pDLY8GUV8+FuCSKfVPhVv69BWWD4JnVq/KEm2IcpcVR/m7+QZNe5K5x79MXPX0iSPFJeHDcwsSq
	eR4a8UTVwMyhJMSneokjoPYYmSq2J1yGMAbp0rsePJRAmQnA0dQek2kkMQ6Wa/G3Ci05S+XYFom
	ZG9Hqy/rqiw/DW2XP7a+CbwFb+tOJZRulfIZIJi6jvZ/HWGNy2xdKrsz6xw7rOTrMJCXP6/6odM
	oCXmDrI2QyKLn7KaYXxzNDNNN4WRA+Y+3BA9ctGeGXxQNhGPQGu7XdntUUL+bdklRr1mne+OqGl
	+ou923PtGDisQPEff1ZJKv1lfHdXZSIViN7lAhwGAolVtrU/aYEB0ldzCCAgt4BiIOM6CRnIDMX
	+B0iuYBrwtVPNwHFdET0+83eMrsQbE61VfTUq6uouk=
X-Received: by 2002:a05:690c:38a:b0:798:777b:bca1 with SMTP id 00721157ae682-798855a5c91mr67118247b3.30.1772290153804;
        Sat, 28 Feb 2026 06:49:13 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c53644sm32935877b3.39.2026.02.28.06.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 06:49:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 08:48:54 -0600
Message-Id: <DGQOF3UZ0DLL.1GHNUH13KGKB2@gmail.com>
Cc: "Patrick Rudolph" <patrick.rudolph@9elements.com>, "Linus Walleij"
 <linusw@kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: cy8c95x0: Use proper error code
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260228020538.1103307-1-ethantidmore06@gmail.com>
 <aaK_v2sSCRe9CVYL@ashevche-desk.local>
In-Reply-To: <aaK_v2sSCRe9CVYL@ashevche-desk.local>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32346-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 346C71C3B87
X-Rspamd-Action: no action

On Sat Feb 28, 2026 at 4:13 AM CST, Andy Shevchenko wrote:
> On Fri, Feb 27, 2026 at 08:05:38PM -0600, Ethan Tidmore wrote:
>> The function cy8c95x0_irq_pending() returns type bool not an error code.
>>=20
>> Use error code -EIO if cy8c95x0_irq_pending() fails.
>>=20
>> Detected by Smatch:
>> drivers/pinctrl/pinctrl-cy8c95x0.c:1303 cy8c95x0_irq_setup() warn:
>> passing positive error code '1' to 'dev_err_probe'
>
> I sent already a patch and the code is -EBUSY, because if we ever get non=
-zero
> here, it means that IO was fine, the interrupt status was not cleared.

I should have checked lore before sending that one off. Thanks for the
error code pointer too.

Thanks,

ET

