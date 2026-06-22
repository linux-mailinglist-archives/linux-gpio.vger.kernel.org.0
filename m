Return-Path: <linux-gpio+bounces-38773-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s+yHMF/wOGpHkQcAu9opvQ
	(envelope-from <linux-gpio+bounces-38773-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 10:20:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 229786ADA0C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 10:20:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AiyWX2t9;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38773-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38773-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BF9A3036095
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 08:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5B639020C;
	Mon, 22 Jun 2026 08:13:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6086238F64C
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:13:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782116001; cv=none; b=kGuJRxtAU8jafV1NqEOYzyV3NYy7IclAIX32fFG1J/cFuQ/yHqRE7IXgermF7YEhXWudlFcMQo6ZElaubo99vk/jSuNaudHnMl2emfLXNZtQbGQQp+LmYRUS8nitivsSV7A+/YJv05w4X2OOzTtqUIlylOadMxiy6pNAGbVa0cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782116001; c=relaxed/simple;
	bh=16gMpuqlil3yavO9XqNLt3WpOT1bGdWJhnebndJx6Ew=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=heq4DnfQBCRYjPwKgpDe2dbgOAYINnpVCQdbSR9TV3pU2iEuRI/f4Po/TjK1csOtqrJwlJ64WpXa3omZT1ZJbHeVZ05Xp6AnGTnI55jCovnIWPBmCy840M9J+qGdRFdnyrYBx0TIqFKVfKPg/x5E/AgNGBcJQdgxuDlabY3jOW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AiyWX2t9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4E01F00A3D
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782115999;
	bh=16gMpuqlil3yavO9XqNLt3WpOT1bGdWJhnebndJx6Ew=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AiyWX2t9iyWK0LNLv98kwG4X9HcMRFqL/nAavncg3BwzuzudFXuzoMyekbdj+6G02
	 2Y0s+A0AYHCSDcckSfJN4v3FLd8j6LWmbxz3V7RIXZYzseEXqGIPXzNs6/V/w3AKxX
	 0ZREYGYmQNo8blNpd4HhjRzYDMCxrpJMZ0saMiNC5rB5uLL6V3Z5FKSVY2sVhUwq6l
	 9ygNWE6Y/zxq1k06ymuA86O91BQjHR051PknFXboSDkkLLG7prYyaA/SGsAB0i80l0
	 /SiXN7V4uOL2ym7dtySZbY2E3km+i/NQZjea7wN6WCNA1fDNl6eXkec6ZrROeAOoXn
	 lvV7KtrkixfkQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ad49da7123so3431438e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 01:13:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8HRgzbIPVURmgd3GAikD5TF8jcBNmtvcN/iuuHyytINVQDURdjjJ1CqHp3GOauYi+f8Dqk5wgDOvh+@vger.kernel.org
X-Gm-Message-State: AOJu0YxDVfSPd8tXjkUXFwBox2nM2jvBsxN6ZzU3rplaRMHOPWz9QOw9
	Za10MAlrSvO1hxYxfklK2/9NVi84juXbagrwh8IzyIT1EHUnWx+KaJ/nCTkJVXVuIc1qKavFlIV
	+P+CwcMpooXF0xLsru/EQ+GnEAwd9sUW3f48hIVKVCg==
X-Received: by 2002:a05:6512:251e:b0:5ad:4a8d:cf29 with SMTP id
 2adb3069b0e04-5ad5721cc04mr3564002e87.12.1782115997751; Mon, 22 Jun 2026
 01:13:17 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 04:13:16 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 04:13:16 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260620-smaug-audio-v1-1-e318acdf5abd@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260620-smaug-audio-v1-0-e318acdf5abd@bootlin.com> <20260620-smaug-audio-v1-1-e318acdf5abd@bootlin.com>
Date: Mon, 22 Jun 2026 04:13:16 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfSfKBpDgsW7ZuYHCkEu73s-oFOJUND4ziXH_TdG7ab7A@mail.gmail.com>
X-Gm-Features: AVVi8CdLrWdNhP6P3ebhd1l5V5oDEuKly30vQC5C1peaCrzu1asHfo7CiF05qxw
Message-ID: <CAMRc=MfSfKBpDgsW7ZuYHCkEu73s-oFOJUND4ziXH_TdG7ab7A@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: rt5677: Add GPIO .get_direction() callback
To: Diogo Ivo <diogo.ivo@bootlin.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Oder Chiou <oder_chiou@realtek.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38773-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,realtek.com,gmail.com,kernel.org,perex.cz,suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:email];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:diogo.ivo@bootlin.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:oder_chiou@realtek.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linusw@kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 229786ADA0C

On Sat, 20 Jun 2026 15:50:58 +0200, Diogo Ivo <diogo.ivo@bootlin.com> said:
> Implement the get_direction callback for the GPIO controller to allow
> consumers to query the direction of GPIO pins.
>
> Signed-off-by: Diogo Ivo <diogo.ivo@bootlin.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

