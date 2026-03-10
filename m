Return-Path: <linux-gpio+bounces-32877-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Hy5Ema3r2mKbwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32877-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 07:17:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE72245C46
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 07:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D869D302BBA9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 06:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC00322533;
	Tue, 10 Mar 2026 06:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwS1ehNU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A203C3218DD
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 06:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773123394; cv=none; b=qyMBeWFP3TvUzsvtQuSFi9mAy6FojcN4/0EejfR//S8EK8Hi/ilncqQspZtKVcwlVzbS0xp1OWBeiMYh8JPLsUdudg+BHM1WzxQL6ukR+C1Pf0NY7DbdjD8ZYP2x5ddC3WHusS8rD/bOgaTn8vZIp2235ID3iKE7aMxkxIFIEPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773123394; c=relaxed/simple;
	bh=NhI6oA643rmBAg3KYT86ia+E/Pf+LDBAwNCdXohHikk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpWa7Kf6EMWM+pZDfTFXs6d2Fuzd3y/DjbDDwL44qGrZSBPMsKBN4R0Sa4HqnO/tdfYqhj67SN1W5W2tkArUaAgqVWgSBWwvsocoioyorJYMer5nC82D5eY0S87CjjZdWc4UUhaE7VLQDOL6dO5Qb7d6tfJ+OdZ7XK6sJg0dKqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwS1ehNU; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2be26842fd5so4091189eec.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 23:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773123392; x=1773728192; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s+/i4XWfcbGmIxwJyix2mZgFR0owAbkzFlUtp0W0WII=;
        b=HwS1ehNU8drHfiy2pBF/CrewofP6+T1VxYXDmIWCTimDhsM5oQvN/+u0tpBH0R4UbM
         TtnJpjMO347Qg7WtQ+oc1Do2uvSHPiLlcfu3SyxcKRmMLR7xGNvjs8XXndxr3kv/3Z16
         vU2K8jnEY9sDVf4QTgMqx3E7LGzmLLYYAFDEB/TjjT+lxi1UqVcj5fHIEZg4W2AnZAwS
         oTttxSd5urYSNROBr3uYDB4cY+BQ6wPZ131srHGqzNCm8e/VKHdOj9WXIkFxpKn86+JW
         nszjJW/DSVE9MmYHP3stxRt2y9sFCVtrrxDZwUO6uS2a3jQ5Xb6p0Laww7gG5UqhsUnO
         ZNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773123392; x=1773728192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s+/i4XWfcbGmIxwJyix2mZgFR0owAbkzFlUtp0W0WII=;
        b=ioYRKCbEclaXhIeeWZcsQOQdM2Hnk4xp+zilUG1P1MuLCtgZ19peUxk4upWj2DY4dQ
         03bAzeCFhmLaPiiFI4h8GloJxfID8EiVNHJRMg3YqzfRm/tL0SIF4SPTCf0URQIHVP6f
         EbkvzB1tiqBLyd1ePggRlG/mgk6UIIy7N/rXUt2ERB3rdGMRx+3f0KxOLLhV++iiVbSh
         LVk2gP3SbSs/7LGvKEzAHV7vjAbAHCYCwrhKhzCojzKJcWhRUaAblovusBwV4LRPB8Zy
         QeIkpy64banpl+rnqdZW2QO8uSkUdvLPEZafbOzCtBFSr2JQQ1yf1TmJ753h8KbUzTor
         8Q8w==
X-Forwarded-Encrypted: i=1; AJvYcCXm2jstddKCCemsQlETrYFlgcFQnCCwyPRVXwtVA0Is1RTfpWwmMx5F8PNtGw436Cy16e6AemS1b/F9@vger.kernel.org
X-Gm-Message-State: AOJu0YxlarAHvdLw1I4xLUQBsAqZGrmXc1H1m/8CONjXi75nnM2yZbXl
	sOkBWSN7982AS/bCoafHjPPfcn38Ztil9FIn1Hi5vvY4XhhrY1AHWqay
X-Gm-Gg: ATEYQzzzLbbdL0EO0E6XUBlcuLLeoGj6oeGXs+tWDa3mwZiN/jlZNVpWx0OgQ0oSTqd
	jViDQSKkEcdirzirtX1DwaXctiomSOFVxk4m8JoW6Y81r6ywGz4+3VFry4mSLGpoHD4mnBp5vFG
	eL19SCjFG4RhVe71/003iftc81rvng7QMJocwaV7wE0CBffB9X1U+02DJbKFvCfFpNlGg13GyHF
	BGktSwJw0T2hFVrpd5r+5tEACFfENIoZkhtMZtBvA1zD7hddra2LlYQQsk1KoehTLWEyyqPyQMe
	XGTYpswL/bXflOOUf+3r0IVEzEFK0zPqQrgPpI7mYGuLoCijb21BatwpuVL43Igtju3OqF/up4s
	OlvfuEgubL2ikeuS95DoC/Yr7C6bF71zbwO4TYouQejyqmTdR9uweeo6e1Dl52RLRbbqtXkKd0n
	+E4FNvvLlZnLoNa7IkB3gpiT91Hzj6TNKtil70MBAZ20rrMQyYKzsZpbh4HXzcBeVq
X-Received: by 2002:a05:7300:dc88:b0:2be:617:1f3b with SMTP id 5a478bee46e88-2be7a0aa471mr958397eec.5.1773123391485;
        Mon, 09 Mar 2026 23:16:31 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2a0a:17c2:21e7:dcfb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f984ceasm14385368eec.32.2026.03.09.23.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 23:16:31 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:16:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: rza1: normalize return value of
 gpio_get
Message-ID: <aa-3BYKrONKrHvTq@google.com>
References: <aZYnyl-Nf4S1U2yj@google.com>
 <CAD++jLmvck+_UG5cNKLCVs2PJb2zynvhr8EbVbB6cYU9925+Vg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmvck+_UG5cNKLCVs2PJb2zynvhr8EbVbB6cYU9925+Vg@mail.gmail.com>
X-Rspamd-Queue-Id: 9EE72245C46
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32877-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 10:04:15AM +0100, Linus Walleij wrote:
> On Wed, Feb 18, 2026 at 9:58 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > The GPIO get callback is expected to return 0 or 1 (or a negative error
> > code). Ensure that the value returned by rza1_gpio_get() is normalized
> > to the [0, 1] range.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> I expect Geert will pick this up, else tell me & I'll queue it.

Geert, will you pick it up please?

Thanks.

-- 
Dmitry

