Return-Path: <linux-gpio+bounces-33133-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PT6FMVrsWkuvAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33133-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:19:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CCF2644F4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C85F4317DB92
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FF530BB9B;
	Wed, 11 Mar 2026 13:16:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B39A2D9EED
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 13:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234970; cv=none; b=i6heds0u4thmARMZ4yPIlohC7nHgdZF3JZYzjufPjuwWqodt/+NyV5DhNj5dhRrvpwrCZZ1le23wNcZV8tdvi0dl5mJcde9F8xFVzwhPu2DLiX36fwbe0WhKjMowSxqibnQYnjG0MZWkLtMJ5DSwAVclK9ObtTgysd6C1umIQHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234970; c=relaxed/simple;
	bh=bQRlE5OR+3/41N9B/xBGXfMeOTv3hgeQ2WrY6jcTpBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3GqgHlVDsOI44E0xyJcc+Vb68QWR9+I3wYlFBEqyzhegUkLdRdHudPBcHfyfiOgiagfLrp7qHqgseRQEI9HMuUWfRQoyzlUB7IzZSIYCWKkrumLPs90RzxfsuOlUPSYpot0ruAJgbMGP8AhNS2DwJGjnb6J91wXG0PCeVRe/uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56ae58f3fc6so6631471e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 06:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234968; x=1773839768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34DR94e/1PAvLLEaib58vFA4GW0m5SGe6jvxchEhMek=;
        b=F0botOraoYj0yaOZB45stjS92mvxq5VWC3LnuTFP9udG/y5KjtXvw795jo8i/X2qLR
         Xk38CR1M5UvBUl24Q+hdJO0+BRQeyAUfaRpoKuFH2iKLM3cKTiux6ynuKSFrT5BxCdA8
         he0b5w2m8yVI9lih2+RMBX6q2tl4Kf2T5hYcCVKdQUmeEOmyOfelq0fp8xkkdfqiJCJz
         TPQ0svhhCLBPnASTm86gvFtDBH2LjeXqYwxii/dbQIIZs88qWbtT356Czg7oJVcGzJGj
         2mPdvv1Xcah1h8fjkzobL2ZMPJkYW8kPywWiYcDzcCnCsmTx43BL7pvjA3kjnqytRy57
         KU/g==
X-Forwarded-Encrypted: i=1; AJvYcCUAF/JEotLUC3x0L3Qi7OWXVj7crs42mybVN9g+p3cQ5C3b6KwkcrD8yoCBAahSDcd3HyAe7eggqXo1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4bwumeOYHsJT9GNKuv8AGIjimbb8pzeq6X3yGEcy5ger75T3g
	lvRlvip1Tb0OxfF5DlUWRNE/iOziNz2t2b0iJ60RZNu9qR/JP6eBuJ6vpHEhXQDKvNE=
X-Gm-Gg: ATEYQzzNF3vCINSrVbxXOmnUsW8MTuFP8B1Pj+Vqrjn4d9t1F0Kf0CZjM04TUeGGKaD
	xkBAmmYJa3zQtvwsACwtRJ8i1s8W6kV6cQdRTTgd8i1A/3LA9AffdAtIZwzzu7pjh7P5w4y2aDr
	0aLKS6bb0tz8IgwkU/nflE2OOoY8vDuavUOJsOwJidprkImGQ9SczPQHP26y/OuWyqUeXj4MhmU
	prLGOmQhsJ6vKKq44YalxeU+uo4g/HExYJ4+emKXH5hurIppy5duFx6NaP80KCet6CxlbfxuzKQ
	yvZTBcTGCB2iiwrfGSyWQDXScK293R7ljBqEmuIF85UjfI6BPLceVJj29lmF2ODAKWyIONh3TzG
	37JIGWCasC7dRe+NuEmJIlAtAw8/hEO9RMjeAMj4UhxbZLwKkr8u93HXNgehI1avfBH/nAnjWI4
	o/J4mu+KV4M7jDynzR9tFPAPz1SCgj57qI0Z+qZaT9tdl8dbEQwOBi2VfzrkGSfNQ+/JkLz/AoY
	sQ=
X-Received: by 2002:a05:6122:8c17:b0:567:5ccc:1367 with SMTP id 71dfb90a1353d-56b4752d741mr856606e0c.11.1773234968584;
        Wed, 11 Mar 2026 06:16:08 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b4645d11csm894860e0c.12.2026.03.11.06.16.07
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:16:07 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56b18f05f49so2419022e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 06:16:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVP6FInLEmP9aArhszi5k8aGbBro7vsDLttmxO78DOn6ESFtwATsMubkP1yAzKPYE4Z1Jg3CQLynWG1@vger.kernel.org
X-Received: by 2002:a05:6122:1d05:b0:55b:7494:177b with SMTP id
 71dfb90a1353d-56b4752d806mr922396e0c.10.1773234967338; Wed, 11 Mar 2026
 06:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de> <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-36-bd63b656022d@avm.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 14:15:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
X-Gm-Features: AaiRm52J84H77ROK64ZWWtJfaiCpnFeKyoSRmPbi-NC8CN6Ju1TJEFxJU9gZQQ8
Message-ID: <CAMuHMdXQ8Q4jvkgFRJYhghz2BZRDC-9Mk6DbXxuaOc6C9DFHZQ@mail.gmail.com>
Subject: Re: [PATCH 36/61] arch/sh: Prefer IS_ERR_OR_NULL over manual NULL check
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	samba-technical@lists.samba.org, sched-ext@lists.linux.dev, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	v9fs@lists.linux.dev, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: F2CCF2644F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33133-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_GT_50(0.00)[57];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,avm.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:email,libc.org:email,fu-berlin.de:email]
X-Rspamd-Action: no action

On Tue, 10 Mar 2026 at 12:56, Philipp Hahn <phahn-oss@avm.de> wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
>
> Change generated with coccinelle.
>
> To: Yoshinori Sato <ysato@users.sourceforge.jp>
> To: Rich Felker <dalias@libc.org>
> To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: linux-sh@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

