Return-Path: <linux-gpio+bounces-34674-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B5YLlC80WmzMwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34674-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 03:35:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E4C39D06D
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 03:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D15030160C1
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 01:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20127274652;
	Sun,  5 Apr 2026 01:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKMiaVbH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAEF2FF657
	for <linux-gpio@vger.kernel.org>; Sun,  5 Apr 2026 01:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775352881; cv=none; b=WtKdF/wMs57uP6jSIBrq8Pxkn/bSoDNNjCC63oJxH4qmwGG8Qc4BhrUOL5gDKoODHa1dnW4715MfnCeTBGDQmohz2WcaPig9ejTN1oWuogVeyNrNSg4aW7FoXLGKLb+GDnz/Int3EyBHor76hCFJu7QW9Asdtd1jEmSweaPjNgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775352881; c=relaxed/simple;
	bh=BTO2POdT+ipv2cFphYkQKQn1cemYVuShK07SuB5qS9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=macPvP7Lhobrk8QXemV/Dm3Z55XAWVICaZvyI+6726ibRsF8OuQDegD4KeEay7Vc57tPm9HWgQ5rcuGHyo/TvuAa5UsLVgeWooQYEAtEohSFuRlIfpU8002OBih47bvBKnhHG3czBdxYaayrDtFwTNnIfalWnBl6zSNYqEYAaro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKMiaVbH; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82a655cfab5so2472590b3a.1
        for <linux-gpio@vger.kernel.org>; Sat, 04 Apr 2026 18:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775352880; x=1775957680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTO2POdT+ipv2cFphYkQKQn1cemYVuShK07SuB5qS9Y=;
        b=XKMiaVbHE3nmeuZDskkhMfS8qBW8h5IOjwR7yrfdWmC0TywjzKCLdIj7MhOKEuvrJ1
         9PamdgD2mxUvH8LDBh7VVJQ6mSwd4amtKRq4lDvEerDBATWdkIXEcGsJurLZ3HROL/ip
         35gOFYk8U4tSKu2wVxfpPwvCWRHoPlQ4tamTbC+MVNGftHUu8yU0sKP/ttWMV7AYJgDV
         tu8nKPPpF1t0HlRYjBDSAHyEfr6oX8/UHB1fhHr2LHnGwybWHUnHZv6q7Dx562dKqDFM
         ORkl1RiU5paU/XsYpHc2R/hzcT8nsSwCrIGMJ8NkRv3aVH3fIecNcmaGfHcIju6K2Xu/
         yCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775352880; x=1775957680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BTO2POdT+ipv2cFphYkQKQn1cemYVuShK07SuB5qS9Y=;
        b=U/TY6rKkiUDlIy/I/VvHhRP8L8nlbVJXHrav1EDA1vJAslpIIwSz0wdWxKi6T+i4hm
         88oPREa8BMAN3CZpm1owAesc4DXvEMP+ZStPttk9+07dTSnr4u0K+v69BK7zwv3BSQbi
         1meIx4JW6ccXJSIcKrAgwR3Ug3aaCtXq9pHLyOPBBlY/hLAvUqHhLC3aMELcT60p0Kh0
         78TOxbWxdW6Ijnvr1x/mg/Mxg42skpPno2ApldNoOnaP7Ls9SRe/D8vN4W6B5ukndb/M
         kHn8B29iCZqN4PLF+RW1haJaGYxHSoylHgXXkbkStbPcM+w/MBPi173ecxsdJUK+v5K/
         PamA==
X-Forwarded-Encrypted: i=1; AJvYcCVhy45Pk2YVV671sISq3tLlGrngWrR3iY8p7Edx+dqF5txAMuPiXn8rbNbJ8FB5c9VRlWqupBjp8tHo@vger.kernel.org
X-Gm-Message-State: AOJu0YxmWhikLk1SmWNwBO/dHeKXB+eHdHHXSyz9oYY6w5ljL0101evu
	a2XKdKBaMzCfeXic6kAA4xWRw8MoqIk23O3YQ5ZuaVQZh37F4aVmJXHOO91hY4t2
X-Gm-Gg: AeBDieuXJNRMdDTyUNM75cdV9uu51pEudzlqS13NZH5jLm5xPTA+byC+cFF45ihwjqE
	N9mW2X8lcDBkM4jwYlH6cx8eSSuum8QrGSZRkwlNE9dyFtCL6i57uquYgTf+8rhZY7HipL5UPfd
	zAxZdh76AAFExDaqv8FmZMyXoa9yy1BhLUyXR6xjQ3grhI24baOBv6zqsKalRyN6O3nZmHFzuDe
	m6xBHNIjtRkcK3o9CjLygQY0keqHVh8QTDWDNazbHStdSRJq2PkMxV00ffRhOMi9uCFMUBncowN
	pD9k7Bha1KXN1ZY/cvE3dRbU0wUQ+n70gGM6kHazDsbvGsEf8LbPvLqQ+RJW+0I6AYpwM759ICY
	QhQLD3uf2ZoLf4ihXaB4wOumdBIdP3Cr8HAEGhZ3fRu+4/uFzWQqkEggDY8StGlBAL6G8+pZADr
	hyBGbDeUezrlCVeJiw7dw=
X-Received: by 2002:a05:6a00:1408:b0:82c:d986:e917 with SMTP id d2e1a72fcca58-82d0daa3c66mr7092983b3a.22.1775352880043;
        Sat, 04 Apr 2026 18:34:40 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:7ae6:3380:c4:fb8c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b261b6sm11765724b3a.3.2026.04.04.18.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 18:34:39 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: int3472: Handle GPIO types 0x02 and 0x12 for Lunar Lake
Date: Sun,  5 Apr 2026 07:04:13 +0530
Message-ID: <20260405013413.31970-2-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adFssnMzgbvKW3Ul@ashevche-desk.local>
References: <20260405013413.31970-1-vasuhansalia05@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-34674-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vasuhansalia05@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40E4C39D06D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Thank you for the feedback Andy.

Could you point me to the series that is adding STROBE support so I
can avoid duplicating that work?

For 0x12, I will add a proper define. Based on the OEM kernel module
behaviour, would INT3472_GPIO_TYPE_AVDD be an appropriate name, or do
you have a preferred name for this type?

Regards,
Vasu Hansalia

