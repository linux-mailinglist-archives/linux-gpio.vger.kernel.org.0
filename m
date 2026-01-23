Return-Path: <linux-gpio+bounces-30955-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id f41NAcHFcmmJpQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30955-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 01:50:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 694496ED76
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 01:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB1B2300AEFC
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 00:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5572FFDEC;
	Fri, 23 Jan 2026 00:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UEWrLgmH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="szdmPHyL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C528C34D3B6
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 00:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769129403; cv=none; b=GlIuksNF8/n+qg1HsiRm82j4cQkqIk0vFnB5AoV+9B4hc/KE7OaYyeLsyZSsyRJ11vGPnqoR1OdK1NmdTJh+1Gdsk2qxgZSfIsQD4K8YutniZOJv0WF6lTbDgeyJLvmEcACvJjp8rmGELtBJG9FvooL0+0gyaVzcroqvHqERaEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769129403; c=relaxed/simple;
	bh=61fxTBvmM+nEDTnrxV8wyBLBgYPiDsz7hg08HBbLwi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egtPTUsx7BHJ9lIJHie54tdAA62mCkjQSdF8fQ8MyTlU7m24ag25oysQIh1vEO8AdSxgooc8wAAEmLzOGNAmVP12A2F+CIlYVqiA5Zb/iIEt5NXtEYToURkfMDdOhfoV9Q1gLnNfj4Ry1tzb8tjlyc8lWgSU6zHopf/x1FnAfcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UEWrLgmH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=szdmPHyL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769129397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GoBRPgL92gOt6XV5p8QK+5WmhSABAsu+khI/gr5kMBo=;
	b=UEWrLgmHHcRpi51aAWBwZQW32Ki5r9cXzrC6+n0xO92Vbca3hnrziZEUOwgdpnPUbntI/a
	roend+QGV0UZ5yzWIILvUwrXRVetYIYEACXpKkVGk401RZKHs9zz24nPVOJiOkqXm8YZOU
	b4ZSr3l2spEdOvw5xz2sWukDUfz2vcI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-kIHVRAtlMDekVcOcpZPPFQ-1; Thu, 22 Jan 2026 19:49:55 -0500
X-MC-Unique: kIHVRAtlMDekVcOcpZPPFQ-1
X-Mimecast-MFC-AGG-ID: kIHVRAtlMDekVcOcpZPPFQ_1769129395
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5329ed28bso361259785a.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 16:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769129395; x=1769734195; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoBRPgL92gOt6XV5p8QK+5WmhSABAsu+khI/gr5kMBo=;
        b=szdmPHyLXUq0kYRZ3/oR6NhVM7v/p/1dn3wFOAKID2ISmeBlGwJ+Q5GO8Snz39Suwz
         rrPDOGaFywpXkwpA95R96xF4i5A5TS35qFkbD6bpMMTLP3sq7dJlpt+hb1+vRramO4CD
         RQyyqJHpEN+7DgoVdI2xhetCQIThHaufiRwzE1YUZiZMewpjYwygi3Rsqn783T84VPt7
         RSdg1EynPNX2FZNI7ok5MUkCx0RRBn6mP1+k90f6GyYUEFw3NsUIorxHpTx+J0ec+1R7
         4NnvTTxjtfgGuYrXZWspOVkaJQxK3OjabSMv4tC6QFBSJB6UyVXR/aYb1jNGc40ro9xj
         JkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769129395; x=1769734195;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GoBRPgL92gOt6XV5p8QK+5WmhSABAsu+khI/gr5kMBo=;
        b=Olikivl9J4CI684h7wZdkYNkglonDZ2T9XskICpiItKoK06jqm80B6JJ8cDRaUH2i+
         8rIwelWG6IiUhBLIcwvadkO0rM2QfELbA2zAO6NV/wQjIKSiPsqCVRylKHQUgL70Kw/D
         +NI5IOWpSyOdNsRnPagPRolXfjFlpuJES4DHdFVGpbKCkc7bc2UjRE2xa9wh9rtGzKsy
         +yIzyPv/qLUlnL0rCQLVHIXEWxWErY99Gg9JKjF+PB+NHrz2XnaXu47KkQpc45k42cPw
         aLBWIBR6rwMcA9sGusQZwPRkJgylJkTc9kuTNBugBJWCo/P6k8WGKNGQSXgYK5xxdLE2
         eREg==
X-Forwarded-Encrypted: i=1; AJvYcCWFtGDUtqd3wRgeL24r8AOqmiOZ0gtEcv7qyJp5jH2bfIZbyydAMkzx6UE8hwA4ujQlqum5LTS6LYY4@vger.kernel.org
X-Gm-Message-State: AOJu0YxavcdP8Qdg3SMdgK+zCO4TInvOfyNO/R48RKCaIlli0WnqRRAD
	pOdgwvAmpMF2JrQO3UWsa/Go+6KrgAiX1Tu76PDTYa9bWCABvk/8lmX0VoFBO2nb3+z9+I0ehMT
	Ip4kluofEAy3LyBZSw2rFQo6Xt7Uunz+okwigLjCDtHmgFp8tdU9s1teXkQR3UcA=
X-Gm-Gg: AZuq6aKNUKFTif7TITgQoWUJgTDAjp5yR9Kb5Fad9yN18WUrFwDCtSBhD4fxN8jZbfw
	H+YbY+5NaYB3M3KZM4Bn/lkrrv3ZrFUoJBP4WqO5KBHLwAdtTU649ZGh2q/VMAWPeufDPt+FjC4
	W+wmPQRHZXsa1ZJJmLxV1o8ATZOmZxTTBKNxcGzm9E55OePowbuF+x6vPxSvapXbS+dLmrWs6tS
	yaftHYRpWrAYEgGSffBa0N0oryTzYcGmqIaQRgpFT7MQUNsqNqxMoqhPTnpWQmRRnHXQ41b2utN
	59OT0amtKhgTbZqaPBbXTvkoA9spLz6D8Vx0p+9xw647EH6OtIf06bHGsoZjKvXfB/vPfoR4Xxe
	X3G8xqFM5grPcumNHx3SXpk1Cffwl/y/ENtLs1JxaCBVy
X-Received: by 2002:a05:620a:298e:b0:8c5:2bcc:fbc2 with SMTP id af79cd13be357-8c6e2e4bf45mr189822585a.81.1769129395196;
        Thu, 22 Jan 2026 16:49:55 -0800 (PST)
X-Received: by 2002:a05:620a:298e:b0:8c5:2bcc:fbc2 with SMTP id af79cd13be357-8c6e2e4bf45mr189821085a.81.1769129394805;
        Thu, 22 Jan 2026 16:49:54 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e383c2bfsm54737785a.29.2026.01.22.16.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 16:49:54 -0800 (PST)
Date: Thu, 22 Jan 2026 19:49:52 -0500
From: Brian Masney <bmasney@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 00/16] MIPS: move pic32.h header file from asm to
 platform_data
Message-ID: <aXLFsA_bEkXLr33P@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-30955-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 694496ED76
X-Rspamd-Action: no action

Hi Thomas,

On Mon, Jan 12, 2026 at 05:47:54PM -0500, Brian Masney wrote:
> There are currently some pic32 MIPS drivers that are in tree, and are
> only configured to be compiled on the MIPS pic32 platform. There's a
> risk of breaking some of these drivers when migrating drivers away from
> legacy APIs. It happened to me with a pic32 clk driver.
> 
> Let's go ahead and move the pic32.h from the asm to the platform_data
> include directory in the tree. This will make it easier, and cleaner to
> enable COMPILE_TEST for some of these pic32 drivers. To do this requires
> updating some includes, which I do at the beginning of this series.
> 
> This series was compile tested on a centos-stream-10 arm64 host in two
> different configurations:
> 
> - native arm64 build with COMPILE_TEST (via make allmodconfig)
> - MIPS cross compile on arm64 with:
>       ARCH=mips CROSS_COMPILE=mips64-linux-gnu- make pic32mzda_defconfig
> 
> Note that there is a separate MIPS compile error in linux-next, and I
> reported it at https://lore.kernel.org/all/aWVs2gVB418WiMVa@redhat.com/
> 
> I included a patch at the end that shows enabling COMPILE_TEST for a
> pic32 clk driver.
> 
> Merge Strategy
> ==============
> - Patches 1-15 can go through the MIPS tree.

I'm just checking if you'll be able to take patches 1-15 this
development cycle before the merge window opens?

If this series goes to Linus during this upcoming merge window, then
I have 17 patches ready to post in a month for the next development
cycle that can go to various individual subsystems that allows all
of these pic32 MIPS drivers to be compiled on all architectures. The
patches also fix some issues in those drivers that were found by
kernel CI.

This merge strategy makes it so that we won't have to deal with any
cross tree merge issues, or immutable branches.

Thanks,

Brian


