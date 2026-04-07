Return-Path: <linux-gpio+bounces-34755-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMyiG8W31GnQwgcAu9opvQ
	(envelope-from <linux-gpio+bounces-34755-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 09:52:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA0E3AAFF7
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 09:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71127303181F
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 07:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3276D3A3E85;
	Tue,  7 Apr 2026 07:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="jXYaPDgB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F1B3A381E
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 07:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775548246; cv=none; b=hXjT7hnsnLF0FgYqcIh7UgvPhKb3ZZDo5V/SaovqyZ0Opi+7CM7snVQ9PEAPGKtifL3PJhHUVjJOqugNfQT896sp1omUEcwjuAJlXIaPCMzmZs7u8E/x26yC1bkQOeV9vZjxx/QR8ZSsnO2nxy3avLmABbB1MdMcZPoeW3MHfgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775548246; c=relaxed/simple;
	bh=eca/h+do6RIFotxCTr+RFfKX/XHK/c61LD6sOoH0Lbs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G/ljTXeSdgCy986bxB83Em4zjZBHccxRE04VcEjx9Q+5NjFO8AEKrX1gUr+GslJDENf+BJHOw4/igtK6EawgM080r2b+xCjFHFESr/LQ2xIJBSNIFv6LyCD007ztQXy3Ec6QFlZlDc47i/UBc8c93B0qTvAzeygB5FeZbhzWQo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=jXYaPDgB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so3811864f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 00:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775548242; x=1776153042; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eca/h+do6RIFotxCTr+RFfKX/XHK/c61LD6sOoH0Lbs=;
        b=jXYaPDgBLBZ1G3g1Y6Kf5XyM8gGplJIV5qQImv8obKiZzJT6INQrVmZ+z1QrxcmvUp
         wlxeagStJHxC2Wqe0JiP8RcVs++1SB2HZUmKdY2ZgtHOtm01ki33lOcx2CHX3+biM1ap
         fZhzPRGXT37Ycz6uFtkh2g+5DV5VW/cYkCz9f2cTiDca7Y1/cUzTb/zTMmVDweRM0OUX
         6oDU5tpznRKvApxbkjR6C17FBQi1PD9cg9+phEUooFRBQ85expesGa/FVlEoahtWNoew
         AXvjx7v/b2FmPTM9susG2/gLD0irlHuCqzX4aR79VRfNSt3QCVi4vbyhIE3Yy7MaUCnr
         vmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775548242; x=1776153042;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eca/h+do6RIFotxCTr+RFfKX/XHK/c61LD6sOoH0Lbs=;
        b=MP3m2Rjs4r1NdN0jsVBQTDVhn0QCXZa8zOkhxLa7dIjAxoJk4W09JgYvzhM+jQtTAG
         qLCtvxz0QBQCAVMS87RmQ2DK5fIKr8S3fu7I442Q6tv9S3t0En4P000Ppd2iu9sEMtw0
         BagRYu4VOTyy7HmoBTSa+Ii009cK4+h9CX5od4CpaFSPBtTtZeqmcj8YtYC3CDMX5FSz
         eZaoF/zAjQ9nbObzL0vPN/1go/OEk5+1/eIb5EckTQjWCb/uJDWVY1ZA51RkEdQHkne1
         kG96w2776UgVwq1cqiF5O9MGQF/vx82dWJYgtilElI6fdlgcF6N5WCneTk45kIbiTXMY
         HOVA==
X-Gm-Message-State: AOJu0Yyfwj8uezsz50YnpaTe8PzxGbaeeLhuX5KPLiitT26IsUXWwWps
	jlxesEr/tOoL3eNBzT29Fu9JylY+fsgQrWxkfmvQWeN/bTfcgsXYdkpgYjXNqDsYOkE=
X-Gm-Gg: AeBDievm4z1xV5+8Hm1WQSQhDgHCJvowqIDB7iiYJ7Xp0PTDokZtRLgTo4aWHH36fLb
	bhhZxaGEi5MUXKuLFhJ0v6eAT+TGawyW9pwz8JMzigSeEwKIR3hgtfJ/6huS4L931qB9gY4glWJ
	Cx5OIsw8PtdhGmjoH/XnqWBm7HHBREFLR/wFlVL/S1omaUzorrqx0lQrWInNKwDQiClEcCUFXhY
	oyHT2RtqKfrgpvFW6VqgjPuy6O4pl/mSWTr5Dzl87hAIOXbioTR/Qe84az87MZn7y9sXtQkVAnC
	VXeLrNi2wVd8iIzOl2I0PF9ps7/zlCT7gwisGg3xCDrurESPjbsWfPirpKg/8qE6vpIjgI/kvhG
	4PuNozTSQlYpYFJy5fDvIiKylQQSzEqqKKg+M3iCn6m8NtYrtcPLMxSMp5+mNWTdUggQZ75RxZ2
	LLl1sRAdT7I/ClRERFt1nCPrDZ3gi/XfngSoI1LnZUsi6KMvXO3Xg6t8p2a2M=
X-Received: by 2002:a05:6000:61e:b0:43d:1bf6:927 with SMTP id ffacd0b85a97d-43d29295ffdmr22422634f8f.14.1775548241517;
        Tue, 07 Apr 2026 00:50:41 -0700 (PDT)
Received: from [10.87.54.69] (mob-176-247-8-139.net.vodafone.it. [176.247.8.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e56fesm45883632f8f.27.2026.04.07.00.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:50:40 -0700 (PDT)
Message-ID: <e66a4241ad77859921a4562dec17ab932cfd79b0.camel@baylibre.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Disable all pin interrupts during
 probe
From: Francesco Lavra <flavra@baylibre.com>
To: Linus Walleij <linusw@kernel.org>, Maksim Kiselev
 <bigunclemax@gmail.com>,  Sander Vanheule <sander@svanheule.net>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Mike Looijmans
 <mike.looijmans@topic.nl>, Dmitry Mastykin <mastichi@gmail.com>, Evgenii
 Shatokhin <e.shatokhin@yadro.com>, Arturas Moskvinas
 <arturas.moskvinas@gmail.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Andreas Kaessens <akaessens@gmail.com>, 
 Radim Pavlik <radim.pavlik@tbs-biometrics.com>, Thomas Preston
 <thomas.preston@codethink.co.uk>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 07 Apr 2026 09:50:39 +0200
In-Reply-To: <CAD++jLkdoD=0RjpAMLWTMRtUX1+3tB6exOu5=nC3ERBYdrUiUw@mail.gmail.com>
References: <20260330161914.1071118-1-flavra@baylibre.com>
	 <CAD++jLkdoD=0RjpAMLWTMRtUX1+3tB6exOu5=nC3ERBYdrUiUw@mail.gmail.com>
Organization: BayLibre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34755-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,svanheule.net,linux.intel.com,topic.nl,yadro.com,pengutronix.de,tbs-biometrics.com,codethink.co.uk];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[flavra@baylibre.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BCA0E3AAFF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-04-07 at 08:58 +0200, Linus Walleij wrote:
> On Mon, Mar 30, 2026 at 6:19=E2=80=AFPM Francesco Lavra <flavra@baylibre.=
com>
> wrote:
>=20

....

> > This issue has always been present, but has been latent until commit
> > "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW at probe
> > and
> > switch cache type"), which correctly removed reg_defaults from the
> > regmap
> > and as a side effect changed the behavior of the interrupt handler so
> > that
> > the real value of the MCP_GPINTEN register is now being read from the
> > chip
> > instead of using a bogus 0 default value; a non-zero value for this
> > register can trigger the invocation of a nested handler which may not
> > exist
> > (yet).
> > Fix this issue by disabling all pin interrupts during initialization.
> >=20
> > Fixes: "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW at
> > probe and switch cache type")

I realized I put stray double quotes around the commit hash.

> > Signed-off-by: Francesco Lavra <flavra@baylibre.com>
>=20
> Patch applied for fixes since it's pretty urgent, and it also looks
> right to me.
>=20
> However added some people using this to the CC so they
> get a chance to react before it goes upstream.

Thanks!

