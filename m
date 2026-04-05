Return-Path: <linux-gpio+bounces-34682-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJxiOlwo0mmeTwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34682-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 11:16:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E95039DF5C
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 11:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E92230136AE
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 09:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E99536EA9B;
	Sun,  5 Apr 2026 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUDDcNGO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1077437104F
	for <linux-gpio@vger.kernel.org>; Sun,  5 Apr 2026 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775380545; cv=none; b=gmaSbxNY1YzeLQhTjPupKxVw1weamO5NfpMy+au70prtJBm+Z4LRhRyXQHbNI1A1B/fpRXggJisn2Oz/fJ7FWHEFhB2xC9kHbps5wC+YXoksVNsFicrpZXuj0EzILfrHQzunOzofcdezqNkhZbZ+RxixqEbovdUsPFDm0V0ciHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775380545; c=relaxed/simple;
	bh=14QcobTYAs6tmK4DZbG1d7Ts8aPo1wgkXwEuKU5/0gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q866x1leD6ze9K5CG8EfQxTQsMp/IB9n5upkcfF6U9Ky/yBfbwoaa45mFxPbF393I3pw1Jsihu2fQV8YVLehYpaqh51kDVBDc0PtQs+vZaG7JO1FC62z4rmk5fBIwaIQlL8LdjgnD6kYdR5poXNBjqv9x6EuKXHG0P7mLphj0dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUDDcNGO; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso2131310a91.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775380543; x=1775985343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14QcobTYAs6tmK4DZbG1d7Ts8aPo1wgkXwEuKU5/0gk=;
        b=cUDDcNGOqWi3JwQgfqiTCe2F87PesAKpVw89ITgY6H3z9VXmdPQVAlYmJ2vjXWRe30
         8lz+4ew22wiI8ZF5doRVFaeh8YBdqvNnNszHpYmIBUsPzWQdoOOBSZHvak1EUmwx5Vj5
         XV9ieO7MJhvpudAXYiVrqEKZOfczapPZ9o/DYlXFMv3sBxICWCrVmx3UL9gGb77C8O+P
         HG81YLIf+Z7lUu2FgyT8vPDTdDvAr4wUS38xJZiDfsjtGjsHWXs3IIyMsfiCVkbpaODH
         +o8En9n8pzWDEMgcNSR802b+mxIpV0pa5c2yOL6J4qtdPE2FHaQXiT2nrImRn1nSuW0P
         Y6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775380543; x=1775985343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=14QcobTYAs6tmK4DZbG1d7Ts8aPo1wgkXwEuKU5/0gk=;
        b=npOmt5HBNXen/2S5kCGmyDmg8WqsdQAhG+qRSRPz2dVSskFaMI02MrbrVp7wVrf+/V
         57cxuAbrfOeAz4f6CBGqPwzcoSoN2hUK+4Pa5V6+wSIjxdAmGcZtHpuo5xLk+DCK/Whe
         L4nkvHDbrInQqmUISKdRzdciRFiR+quU6a3wZLhBSLYzHmUuFNHAsZBFfJJnDkVuZ98R
         +i8Vgxv4u/mAKK0grNRcm+e6rjr+KgXWsnriM9KHLg0eGfE2p/Gb2oS0mi5TW40PNvuX
         mOO60hZE8+PDeBn+J2rMM7/2tw8MQ8nAOGF07V6IA9QmlOWZZaNxKz1W6LwgyElgBt7/
         fVow==
X-Forwarded-Encrypted: i=1; AJvYcCXUpcPk+j/iYJhN/di8oY/E2MUO1IZEuXCm7vWda0kIXEmPLxfqZA1sqKlvVg0eLPzym7issp2eMZkV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+wzFUum79q4jYUvEd2ZAmvdpdRRqAsrxBCbRrMytXz1w3D13z
	wNiEKv7KxuiQZXnaAebi5b0tTrJYUqVrMraIw3SmfOGqrflrQpXhVt8RE8gDTKAl
X-Gm-Gg: AeBDiesIsf0/WvuxPOK+UbwoN+Wju4QG1hPzW4RJUFgITQLGfT7AXh2k3/O/Cyox8RB
	jcI8T8nh34UX4/zUZYdOIYKwZtP4Y/euE5qZ7KGXoplO3kYFEa6UhDca150kKD5Fq5e/Y8FDV7Y
	b/LDdv9N++IbaMS87KQc8Fkt/Xqpyi7v2GviiPHIVc/9SGh0Gguswm67V/+zjZJ50x4aELNk2Kk
	9WZgOUeVeioSwXvF1O5Dgw1PyeeaZJu2aVxkcsHafJqyq8yP0GZCO5MA2QlMA0/oPV8ItaB/UV8
	HOAJgYTJifnqEnKBTp6+hVDVt9gTL2LoPdlMrfoEnTHSIwns9/1+MxYsRmlCky1T0K/jK99cBhw
	TqHyQTmMuSCK8uV0C4w2AxBJoTKNbM3PMks5Z1RRNehzGmkvPbeag+8pzHSL7l23iuvSGCHutd+
	pGWmnSTj+NKWs3glMCvPRCZS4=
X-Received: by 2002:a17:90b:3fcf:b0:35d:997c:8ebc with SMTP id 98e67ed59e1d1-35de69448e5mr8236060a91.19.1775380543369;
        Sun, 05 Apr 2026 02:15:43 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:d639:9368:51aa:bf9c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de674a87dsm3208105a91.3.2026.04.05.02.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 02:15:43 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: int3472: Handle GPIO types 0x02 and 0x12 for Lunar Lake
Date: Sun,  5 Apr 2026 14:45:18 +0530
Message-ID: <20260405091518.5322-2-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adIk5GhZ9ZXj1kt9@ashevche-desk.local>
References: <20260405091518.5322-1-vasuhansalia05@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-34682-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 8E95039DF5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Thank you for the pointer to the STROBE series.

Based on the specification, the correct name for type 0x12 appears to
be "handshake". I will use INT3472_GPIO_TYPE_HANDSHAKE in v2.

I will prepare v2 dropping type 0x02 (handled by the STROBE series)
and adding the proper #define for type 0x12.

Regards,
Vasu Hansalia

