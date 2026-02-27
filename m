Return-Path: <linux-gpio+bounces-32330-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGWROVQGomkGyQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32330-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 22:02:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7207F1BE0B2
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 22:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8221930C31DA
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Feb 2026 21:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609B2477E55;
	Fri, 27 Feb 2026 21:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnBS5893"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEF53E9F7A
	for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 21:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772226082; cv=none; b=P/Ii+hgA/VeDPXmosmfAsJ2NwMmv1yzbtRDeCa9x6pMZSLHQrPFPlxvG6MuIVm5Q9PH6QyHih24cwWGUmzW+Xl2DF404Wi3oCAxXGxTWivtyYF1l1EyrrzeHytyClRe46bG/93GOaewtJWXqZiNjg62ibVl92y5bJtVRHeHg/oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772226082; c=relaxed/simple;
	bh=vdDqUyivuV8XLjk+WDs27cGBDt1Lek9IwEgcJHBHyno=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=u+NYx7SaSBrl2HrknWUANc1tPvZB3FobnSTvmvvzWRMHbhA6k59fSoRsXd5axArmPyO8BFa/xqhFbgDRUXgTbcu+2octYiyzcml34Ot/tKvzsc4tyaUKkyjsaxNpnG4H0xNo2n41199S3GJn/hRpT+TkgCNNCKIoJqdMDI3616g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnBS5893; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79495b1aaa7so23296457b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Feb 2026 13:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772226080; x=1772830880; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0bOhyb0fW1G7j5i9rV4AgL3SS1nvIR3OgIOFnRzk6I=;
        b=JnBS5893xbdMY5dSRRfPKkd/2MT7iolptMM6NCm6pkv0jLBJYeLiVbPHHUld+lMiaC
         X/TQfB5CSc9qO5Hw1unENa4JwROqAoDhzT01l0BPMu3jpNFmdeQzrSBnUAXd8TEzVIPr
         pKDsb0YWr8qIQ8OIHuoY7kJih6XojEsZF/jR/2oVs62fPecO6RqdHtHwfMyUmmyT5ryo
         4KocVuHDs4nrtZX3CB45gU3Eh761WtoDPFsncQgnura62IIDPf7wDbHsv+Ijhw/9EtzA
         fys2Aw3PTuv96W4eGzVRaz2d8QLOy55Znmwf7MXmZ6co3+ujQjqDQlD/ykRz/v/vT1VD
         EGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772226080; x=1772830880;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y0bOhyb0fW1G7j5i9rV4AgL3SS1nvIR3OgIOFnRzk6I=;
        b=aBizXYijh4WAOxiapIAvKcAGB6BonJy8ARl5/PMtCtFw7SkzjsqbLm58umsfXkmt0g
         jjjop9ul0p61qAcS2v+HKkCjXkDddxp7FOusDm0Yoe2SLOaTlutG1600HTdfgx0EC2AP
         V4XsJJzXIDKtm7zX86ijtRyb+eS5T31lGuwZe8fVVQjtYAbyupOSAlmJJtiTrWzrQU+V
         hc3DipHFTrCYFzd3aumHSUDkPWryrfEKYrumx80uC71itCdvFAeMc0FqApWWOjmmg+CE
         m5SQkvCKYBCIkzAX1xiX24sE7ihmpaR/YrBT1FfH9jLzNN23S+UOmDYPDe76okbLcMm2
         dZ3w==
X-Forwarded-Encrypted: i=1; AJvYcCUZngVv7OaQ6wmhWjx+vijh8Y8BTCV5w2cmK0PzmLca8uhL3DGXAHzB+78QEVEbgXIRKlmx/69X5zQm@vger.kernel.org
X-Gm-Message-State: AOJu0YyKLIqhVJs8rIs8QCokVp2pEiVxmEaoiJauvv7MT8/Jk1le5ds9
	HyBLh8GbW2zynqqdXQzqb0OyoKzpTr9KnfGqyEGsOpYDeb9ogLCeV9vlirpm5jeSbyg=
X-Gm-Gg: ATEYQzygsfzpGeGQfT7KT3zjP3dZEjtRL2whOKpsBZflQGVIvy7jyBToMwuQxDR3HZ+
	Sq38RWcYQ9fVoZYvbOX3m78i9lPHqb+iyCmJ2Ltmp+NfB7WCfgooK9dvtuv8BXezElVJ4gKH/zh
	+NlSz1fbWNb1ZUAlKuG/m6Hcwv1WT7w4Ywfp9jY11DPzWDGmbAkKvjE5Yrnm6kkKQIS+i0Tf1WL
	5i8EtHKuvYP5+ab9mHX9OosW6+wHo1WE59TFALIJMh3FNiPlNJRYXG9pngdw8tUgrVwceZt3BoD
	tnzdJLMMFoShsyjTrmGpJlzW0YUzipUaP25YerJ7L5L5M1+zK1epBgMIdi1d5w9dR64+7/0CViN
	zT+7uPn83hWgAukecM4Eut/Huw3p2vQei1atC5jEJvsYrzVJcqYsuTSODIrt2B88oB4Gw+75LI7
	Gfz4lbuURGSS/WhmDTPQjslt8UqBowZLHaJNDFVRGJiTw/24fOYQsBl4HYywo0e35+QaYKKDvDZ
	oIARKO7SaEbDI+9cvx0ZJosB5HAmQ9U
X-Received: by 2002:a05:690c:6610:b0:798:6d23:17d3 with SMTP id 00721157ae682-7988564c5e3mr38210777b3.61.1772226079804;
        Fri, 27 Feb 2026 13:01:19 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c47f82sm25399807b3.36.2026.02.27.13.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 13:01:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 15:01:01 -0600
Message-Id: <DGQ1PH7L50P5.1S6WZBTYH2SNR@gmail.com>
Cc: <joshua.henderson@microchip.com>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: pinctrl-pic32: Fix resource leaks
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Linus Walleij" <linusw@kernel.org>, "Ethan Tidmore"
 <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260224202846.2437400-1-ethantidmore06@gmail.com>
 <CAD++jLkYaEHEy=P68MRLEFsoxDFh5yxna7Eby8KeDzm8F7Zm3Q@mail.gmail.com>
In-Reply-To: <CAD++jLkYaEHEy=P68MRLEFsoxDFh5yxna7Eby8KeDzm8F7Zm3Q@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32330-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7207F1BE0B2
X-Rspamd-Action: no action

On Thu Feb 26, 2026 at 4:37 PM CST, Linus Walleij wrote:

...

> Can't you just use devm_clk_get_enabled() and let devres do this?

I thought about that but wasn't sure because I saw:

	ret =3D gpiochip_add_data(&bank->gpio_chip, bank);

Later in the function and knew that you're not really suppose to mix
manual resource allocation and devres.

Thanks,

ET

