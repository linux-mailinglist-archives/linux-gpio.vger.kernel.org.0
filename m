Return-Path: <linux-gpio+bounces-37664-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oERrBZVIGWrHuAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37664-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 10:04:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4B05FEED5
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 10:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B94930FF7FC
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 07:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFB23AC0FE;
	Fri, 29 May 2026 07:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPaWnZXB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644D53A7F61
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 07:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041490; cv=pass; b=O+kUZiCZC46e28MLshFG8h9mp/4VXWwIlPwDd81BxHWPRbhhozaTjVk0D0cQvCD4D4H3qcxxXgwU/C4pJKIP8fkUeCS75/Lkv76Whi2a1vxFN4iXnUN1K+KEX+RRipILwDYDgzaKc55oSDh5Umpa9FnClzs7A8QyZro8M6dMELc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041490; c=relaxed/simple;
	bh=a0KniOszvMfa6XS1uuRuomxsbQoyEQFI7eLxL2NmUQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYDc5OYCBS39u22Zm5U3mUs1yoONRTyYY7zfzklfJirk5wrj27gPjNOOrVmrqXtgOej3pjfDUzUmMUGrh0LpI9xxEHl41N8yw9cRJPWylbau4l1zULFeB6ZTiZh3lWujVU+bh4Uet8vGOZ9KIsrlwOsFpxoBVhvgEGXtvUSGr9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPaWnZXB; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c856db4fcacso867901a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 00:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780041489; cv=none;
        d=google.com; s=arc-20240605;
        b=Om063Vx8eG+HG8JE78jS0WLKBnp0k3WG4K05//2aBBHnHRMWwTDMtl6K1K6WwEQmX4
         d76kaYqCRrqaFOConLEfRNGZ9zr0fT5DCDRZ5etI6BncKUW+A71zELHjX69LOTctnHxF
         e8vGvo3t3/34oLWFzWZLXyWv92to1W5kBojPqKnAY809Xp91iCH4lTyDKdqr1tnbbB2r
         6odBXeDwjAXf4m21c9NMO05p0ZtPDLvFuxWPVEIV4IsYAvofHaGm75RxtE/ywQYrfjL+
         vyTNAEDz9AXzQ2DF2Jv328ow5n01EaqhS/1ODEfYvgmClnUJQ8Gz6+7KmTF4BzfM6aBj
         kJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a0KniOszvMfa6XS1uuRuomxsbQoyEQFI7eLxL2NmUQs=;
        fh=XlaBV9ZdaXLQKqeZowXdHOY7Ihc5m93fJ1RdgUh9roA=;
        b=hRFbNSMbOZ3R3T5esxXprjsJJQx+mPjMupdID6ZW/FvP5nPgrd9+VCDdstWFPv8OP8
         soBvQnJ/MyXSe8BZa8mieRW/upHmqcsdqEuE/IiQCcZDf0X7pfvPkLsueUbL5Yw724yk
         n9mvZxsVPPPUp9cnc9YzUH7aim4pcoDIFZMpe7/+RsJOFSntOsWpSufIp/8h4oMA4ikU
         w7PM7qa3Ba4G9h/6tww51VrolRQ41OLBLCbEcYsDRrhrcuwwRNEvs6DaQ9zhIIgJrUe9
         LHUzGcNf6qz9zIVkImLa9hnzrykHup1DG6S0qFDd/S2jdunu7zHrqezmTIVfaNTZO0Z1
         hC4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780041489; x=1780646289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0KniOszvMfa6XS1uuRuomxsbQoyEQFI7eLxL2NmUQs=;
        b=PPaWnZXB0K3VGnxiNC9w7SWFiMeR6BIFztop+8eTkqkHbXHlhHH+nnag0CH6ginHte
         n3xY+4Am3HSGAYVycyefoA+c6VANgtdmhPc67qqPkSGi4gkU73xnZBOeZQ+DeuzM+Foy
         P9KjQgPN8ah/Gkr0h58xM1HlR/THfteyfo9w4Kjg1IKndSY57ALNxrDb7n9sQPVEFKzZ
         O0SauuBMiBemVppr1gf8OHJIHv5NyDPtkkpwtkV53eFWgGLp4PseFhbPO9x0zmcSPICP
         gdQgzMPAtjY6C7S5XRC7FSwOy62yT4G5IWHW7qFA6NGlsnj+cMOOICsylqeVBHeWmbcT
         5/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041489; x=1780646289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0KniOszvMfa6XS1uuRuomxsbQoyEQFI7eLxL2NmUQs=;
        b=Jp7d421rZEtvfyX1KarFP+u7RIBrgNKkMrmUI3XJxcVIflPkgz6fY5TzfxteYre4Hc
         tpSdKtLHfBqnEsNzY38p6SWi1PO5fAr1ySfs6L5lThFmU6KVtG+VXQc9RRbbhMkh+bz9
         I200z4PMkCdFo9z+PAIpp9OXgNijnE/0lpdjy+WmHIrN5ud+PiF5H6DrHOriBRi4h3js
         FmRIBJ8w+bzWUMbEwsvxPHKTxdXTJ1W8wFTAdS9LlwGhJlgPr3eFzXyVB4KW3IQuKa3+
         ZoABwKLePnYFR7amjWO2d38AWuWQw31Vnb3g4mNmTT4hWPlUYWBGeoWctyKRwMiw/n7T
         Q3fg==
X-Forwarded-Encrypted: i=1; AFNElJ/OFeU1xpQy5N+U7LKt1hOxwT2lI/+EZ0Z2Pi9F1BPHJdRQBDW/3R/4hBpncUXUBBLyB049tp5mv2+1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3tNobuIsvyVXQODF0U9oxoBDiQOG2iHqgri8mIC5aUInq6WMh
	a1BXIIftrcRWc36hr0tygq0gz4rn3lexfogHsiZ2Gp9Ur3cfmw0o0eg4JgCVZS36yGSOBMirZTK
	CY9XBoZKcAKii4SWUAhoZgXswngoofCg=
X-Gm-Gg: Acq92OGfJX+r9LZqRKcrepChAUS6/08f4hP3PdqVrz1jgqQ8CkFNW9Am4krMKnrT3ur
	jrxMSBjwFZf/WSSSzm5s96gSlEBm3W83jtF9ItplxmgAPU/AA9uI1m7rAJR3iVB9/mBlrg7ZbDD
	JO7b5bSS7g0ICE1ZsyjRp6V3CGV1wruY7PZAzHVwVRUSaye5DSi3qqC+GRXs7PBppFZVXWiAE3G
	v4fV9woW5b09Lpi0b+7unVxV9o9Uxwfz9rd5wm8CuygPecVrqsz/UijpMeJAZ+KPBLdUV+XriM6
	4y0ERiZXrc7kLJD6CWg=
X-Received: by 2002:a17:90b:3e82:b0:368:341a:a925 with SMTP id
 98e67ed59e1d1-36bbcfaecf2mr2292215a91.23.1780041488492; Fri, 29 May 2026
 00:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779893336.git.u.kleine-koenig@baylibre.com> <b8f7581e9311d5579447304ac4f2d557b29e4f9d.1779893336.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <b8f7581e9311d5579447304ac4f2d557b29e4f9d.1779893336.git.u.kleine-koenig@baylibre.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Fri, 29 May 2026 10:57:57 +0300
X-Gm-Features: AVHnY4LQ-jWF2c7_aSBtntPbH41tJ-A1RaFPwn1TJSq1AkOwWmb4Y_coE3Xjxe0
Message-ID: <CANhJrGP7vSUUd0DSsyqgE+CyLp4mgsO0zkb0JexbER7W50nTDw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] gpio: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37664-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,gmail.com,linaro.org,free.fr,iki.fi,kemnade.info,baylibre.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,baylibre.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8E4B05FEED5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ke 27.5.2026 klo 17.57 Uwe Kleine-K=C3=B6nig (The Capable Hub)
(u.kleine-koenig@baylibre.com) kirjoitti:
>
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.
>
> While touching these arrays unify spacing and usage of commas.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

--=20

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));

