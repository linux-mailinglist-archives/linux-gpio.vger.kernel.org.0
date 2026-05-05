Return-Path: <linux-gpio+bounces-36108-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBZBEF9w+Wmu8gIAu9opvQ
	(envelope-from <linux-gpio+bounces-36108-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 06:21:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB054C6576
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 06:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D8A9300610D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 04:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C29F3AF677;
	Tue,  5 May 2026 04:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDAEvjNB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC21C3AEF5C
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 04:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777954909; cv=pass; b=udbT2o9/ETHL5mZkfp1FsV+tb8ufHMeIeCeFcgdnsaCkAuaTvEBB5ZYKjzeelafSOyqgqOEBmVxnIFHFkJLYQ04AvSBB69DkR8+8HLBY8IrvR6UxbP9FcXtZrcq/qh8hceVYUo30Zg3bHcyDBAj7ZVhGUf77FlGjKAKegIIEXYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777954909; c=relaxed/simple;
	bh=/f5lulraV7xC48G0DAyHOKHBvu8TWDJIATOrngU6KJM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ieq/vhMdz3EL55ONX8KrAGvzMnFgm3cN9We4iwE2wMoUCqAX3jrtAoNzsSyH41jDG/jOle3lCGiHJaz/168IjoGaBsS5E9ZQd73B8LVXq4qhKkhEGkaSTYZd0DazGqED5/tqEjMkcFRTcT6u2MC0tlh9GQGCsuEMd6oUglgMKYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDAEvjNB; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-794719afcd4so43807507b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 21:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777954907; cv=none;
        d=google.com; s=arc-20240605;
        b=cAP+1dLqBEkFUIWO3KojHda7qFBA7jv3b3eydfaHrV1MWKDJSIS4XmFJXP+G6ih6yv
         WQ0/EsSTxYAv8xSSh5+Oz8RWXUSwGNabok84GszvDV1PM8U3i96ED97VvDzIxzPGy0mI
         7qMYhzMgKLtLxF3whZeJWbeRs/RHR2uKquf1eDMWGaUmN4u3nbeenHqdOUyxaOb77PXE
         m1VzzMh81WOp/GOqliC3n5dzOMo5w50oAJX1G7JD+UEjwOrurdbtYgjkDhCPeabhd1KW
         OpeCwEmZxFZNiwime7/ywDDfiR+KQ3zZwB9rKkVW+AK6Bh860UXOdETHjci6W7lrvDFq
         Cnig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/f5lulraV7xC48G0DAyHOKHBvu8TWDJIATOrngU6KJM=;
        fh=k6Gdcva8QLkPTbGaUaUQ2RREwm1LFYbBgS5PbczPOOQ=;
        b=NFut/mcTYs1dM7Z7FYgPtmWmXL3iiW+BxTrcKxite4uCwID/3MCuUHWHgu9HWcXqKy
         ztDH03A6h8h1JQQVWRpLJwCP126XNCrpE1PTuhkAnkNxokJ7ImOkPG+NYDHhH4aTfMhL
         xZRMWObFtZQOZim6FpWwjCR1kAewAG4uSodxHcbTYhtEl1Gjhgx0xDa1ewR9Oqn4gIxH
         Oy2m/GdC27nVuSe02wvLUPxyDjh4EJ3BGlj5PMtl54DrOZVk+OkzUQQInLFexBXypDWU
         D6JsVyZssYBd1Ay6e8klFP7PqzJzF8rny5Il+JXMJnzU1lERRi5oNh7Zd2FTV7NLZ74M
         KhIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777954907; x=1778559707; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/f5lulraV7xC48G0DAyHOKHBvu8TWDJIATOrngU6KJM=;
        b=dDAEvjNB6DYjGldPgSfQkOq4kO9q3rzrkKar+bJhHvzGFvGihyg460UCEf45oV6hdt
         ACeaCaXPYByqKQgwn7C3Ywm5NCKpm4MEGR17IKlinOkVDx07+oKmxPMlJE2vy4d270NL
         PU1I3nwUMnp7jxgX1LccuDEzIpsW/khBwbJ+sVCG0U6XCiO+sB1abNKkVFf0Kev04+Vs
         wvfwG044ZY292ZJxY0uwlN47oiAQXeE5m1FtAPzb2IEGjPKj6mGbUsVvEN7q9GudGzBp
         tHJ6YFLBUWOWNY1b4Qmu3GGh7dtTFVdmRC61S1rNXCDkWzfrtbdroYD5pz7pUZZ0TeBJ
         rH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777954907; x=1778559707;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/f5lulraV7xC48G0DAyHOKHBvu8TWDJIATOrngU6KJM=;
        b=cQUWjVoErJaAAsfU8Wzst7jQKkzDw7vg+WpEW7KERTqSzYBMlAY6dyesPLqfj4+M3j
         GOyt/q86LALXP/iXWAwKSikvyDrVC3iAGacrZAS/WC4hwP/J8enQOfV50Y9gxvjULzUO
         Q+wNi5hDhz4OF/c1fgZnNNcOKgf9nDacST3sSRCnKmry2daIDcK//gc86mJMut0oQKSR
         NTfOM0Jal+ENztRDFaTNJ/2NHwXDQd/9TQpBZwmmNTezReglfObvM4IQmrlL1J8Y3nZO
         RzrukZKF2CnchkM66bGJODSWnV2DK3CoAz5ZY+0XVwrkAhBFPxh0+xd9rYhn95iJAVgG
         UP8g==
X-Gm-Message-State: AOJu0YxHTFJty+NDE1uX5UJws6yrEIM4IlO5GMyL1Fz+X1iLgVQRamQH
	PtSMQ4yFQZEvNmTR1lmIHS+Yh0YpFobefl5HIuLwgq3GuGDDwpJY/RPj4EsUacGBr8rJsENE2+m
	LpqjzeN9WLCsahlrphQTVSAe9gVvORbI=
X-Gm-Gg: AeBDietHMVYE7NpeAxSem4P0DUH3amUspuueg5HSPcEzW/QFe8E9tpFxLuu/hS5XwQ4
	83DJ/O2NdgSKVK5vwndhNZZIGUe/VdaCop/cDrv2Qr0G6lprG3tMgiGB2qugW6t3MsRlTRtgBhd
	UvXueGdAzHtz5iLjcVTAMBuaCOIs8Fk8fDBK5wFDilxT0+5n658/LJ1VBzZ3KHEn/gQrlv3k07C
	Ffgf29zPjq7hl64dVTiaDOX6omvscTcObUCMYQql0/8alFDqNKHKJAvnjxWmEDm78vwRcZSKqWy
	oiT63AQgF6f4a+Q=
X-Received: by 2002:a05:690c:6b12:b0:7bd:8d1b:b2d8 with SMTP id
 00721157ae682-7bd8d1be0dfmr75951097b3.10.1777954906760; Mon, 04 May 2026
 21:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 4 May 2026 23:21:35 -0500
X-Gm-Features: AVHnY4K7poSLJ7x-CFSUa99RI4iZU5fyiKRWJaKq5Hf2hsvBnVXiaWn0pBCGM_4
Message-ID: <CAKqfh0HqJoFRPrgvQG84iFt-0-vQd0fz3x6EPhzTgikss+XiWg@mail.gmail.com>
Subject: [RFC] Precarious macro in tools/include/linux/string.h
To: rppt@kernel.org, richard.weiyang@gmail.com
Cc: linux-gpio@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	linux-mm@kvack.org, Lucas Poupeau <lucasp.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: DDB054C6576
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36108-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]

Hello Wei and Mike,

I was recently helping a new contributor with their patch replacing
strcpy() with strscpy() in tools/gpio. After some research I put a
hold on that and realized that strscpy was defined as strcpy, which is
extremely precarious and goes against the ideas the kernel has been
fighting for for years, and I traced that change back to commit
9e3d665 authored by Wei and merged by Mike. I'm currently working with
said contributor to get this alias removed and the proper function
definition added, just wanted to give you a heads up.

Are there any tools or dependencies that rely on strscpy() being
aliased to strcpy() before we replace it with the real definition?

best regards,
max

