Return-Path: <linux-gpio+bounces-27032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B868BD31B5
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 14:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E29D14F1AF3
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 12:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9052ECEB9;
	Mon, 13 Oct 2025 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Okjf1fVl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B512F2E2DC4
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 12:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760360105; cv=none; b=MQxD/Hr/Yg4VCgQgXJMOL3qOPX1kaQdxWx7kzNp741wldrYLTZ4dXeU5suuGVd526bFYHnwtiMVQb6ucQJ4/4gGNHuzgk7wraXIx9ipzl0/dz56bC+WdHVO+10D5bwLsW7gSy65ApnJnpIfBkiG0FCxPb5pSaWnJza3+o3jZV70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760360105; c=relaxed/simple;
	bh=zt5hEVCNrevPsGcQxcV2hsOEGoKsyrOWbNv+dHo88K0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrzmLSNnq8fhLV1TasPDELxEzQ/5YtjWPH/7VAODb4Zbm8EaOv3XMkX8s9KkXSklClzSUFX6gzjdgB5O4CHGweTSh3nlr67DCkvIQ5CPzt0apC0LK7kMZeG197nu0zTxZ4WIH0T0JQRlQV9DISYpfkaWAV0KQsVSvostNoMZmcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Okjf1fVl; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3682ac7f33fso48271831fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 05:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760360101; x=1760964901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zt5hEVCNrevPsGcQxcV2hsOEGoKsyrOWbNv+dHo88K0=;
        b=Okjf1fVloCuwHYEltROxYnd2pFlknVZ7B7amVFMf0TvT29v/ZiaAu6yGqj5UhRkVsn
         ldb1ZANPVDzhdk/9R+GUouwe+TNHn+3l0DK3VyNfmWYTMntT0PHCCSd69gP4bNqIRdwg
         vsqql6iGaU5+sQMlqO+LgXskAmil8/7G41ybn9gB10A0EhvSmglVy/1d2tvwzF3eRqnc
         6vGgrM89ZkpYHBlb76aFnODpgWdWmx41QDNzf/VQ3itHnWcyyaGOK/iwp/ZVlKvU98Pm
         2iw4Wd5j4GFnUQCt8OQqkyENvX2EtsDnsjQ/GuWzUeGWpeLQ8ll73tc2PHzwjCYtNlK0
         jF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760360101; x=1760964901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zt5hEVCNrevPsGcQxcV2hsOEGoKsyrOWbNv+dHo88K0=;
        b=hg95WhWHaM6luGxc66Icev097h4wiV8qwQ4N5a69Dtz5Q5toNMPDiIvdhbPUO5byIn
         ESdWuhNd0q7VP1vLVODu76P3/tFVxCeK5lYLWxm+B30vF+w62MDP557PIPREshYAiNJJ
         +uExEm8F1uiPgGTOxW8/PAiZB5Ii7lMeUGk8bry3abp+PZnNTJcTTQTmWgMYUVFnyRgr
         sCuuWAKPAENkLt2W7LET6qnTvxJeS8JzK3FSXbSEuBxF0CzdZWBFIuTpYzQHVwYdKWZQ
         L/eRb1DVclsze7kbQ44QFK0I7xDv0VSyduBooNnjFj3+WAbTEEXr25x0w23xaZXtSLip
         qmHg==
X-Forwarded-Encrypted: i=1; AJvYcCWV5DmZm6p/+gdqYlGqPfrrj6m8YJ+3PFv04z6q6uvKkcyR+Fgn+Tx8VWjhLjkdu5Qt9udmlfxsn1GO@vger.kernel.org
X-Gm-Message-State: AOJu0YxCRYMqPAtUImQq0N+jGtXeulauJpLa+PWsj5sCAW72upOEXDxK
	76wdsGk6YKa3DbQJmUuiB8HavkwgKlaYKah8NGbFNeN0WmrGN3ppJ+TrEt2xE36owdEmfrwZ6Sw
	IxOXTrI+arDvcA0qCdvW2iBthgoEid8lbwVKm1UrmiAA5znk4vsfx
X-Gm-Gg: ASbGncvnw9T8f57xPxgV0yDBM5k5/q0lJ8BLsq9g2Tg2W0eRu4E6mFUgjwAxZtraWmq
	Us8Km/Ix0R6/o/gt/DgiSEmj9x3yNgPGAs0YFchNn0Ii+l9uNjWmvcVcoPtFGqvnIhjlCyEItlJ
	lCHjIRcFg9/IacrivfNwwpdmw1x6pXV3anrRhx60A5b+yTFT6zSDEkkUXOUjFAlCbNQfiiIJifK
	+vIcdsb+SQ1cVYea0N9xr2OnKZaCatt/u+bAAUI
X-Google-Smtp-Source: AGHT+IEMJbNvilXOpoOIRQel6Q25owiZoIco1Kl5SF8iRX9hi7hR5hiR4i5XlKv+PrII6XXrbQ676HBjigByg+VgGMM=
X-Received: by 2002:a2e:b88e:0:b0:36c:2899:7a33 with SMTP id
 38308e7fff4ca-3760a29e503mr52205261fa.5.1760360100831; Mon, 13 Oct 2025
 05:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1759824376.git.mazziesaccount@gmail.com> <ed65074dbedaf2b503d789b38bd9710926d08a55.1759824376.git.mazziesaccount@gmail.com>
In-Reply-To: <ed65074dbedaf2b503d789b38bd9710926d08a55.1759824376.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 14:54:49 +0200
X-Gm-Features: AS18NWAwGCk0eH0iAHoOmmcayEjfv4yeRrMRzIvsPRl7tRPyzzsktlv39DuLW9c
Message-ID: <CACRpkdZSiZ_74Ar+tRzVSwRW=6XoUpODyxqZDFyrc-0pcHkaPg@mail.gmail.com>
Subject: Re: [RFC PATCH 09/13] gpio: Support ROHM BD72720 gpios
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 10:34=E2=80=AFAM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:

> The ROHM BD72720 has 6 pins which may be configured as GPIOs. The
> GPIO1 ... GPIO5 and EPDEN pins. The configuration is done to OTP at the
> manufacturing, and it can't be read at runtime. The device-tree is
> required to tell the software which of the pins are used as GPIOs.
>
> Keep the pin mapping static regardless the OTP. This way the user-space
> can always access the BASE+N for GPIO(N+1) (N =3D 0 to 4), and BASE + 5
> for the EPDEN pin. Do this by setting always the number of GPIOs to 6,
> and by using the valid-mask to invalidate the pins which aren't configure=
d
> as GPIOs.
>
> First two pins can be set to be either input or output by OTP. Direction
> can't be changed by software. Rest of the pins can be set as outputs
> only. All of the pins support generating interrupts.
>
> Support the Input/Output state getting/setting and the output mode
> configuration (open-drain/push-pull).
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Nice use of valid-mask here!
I don't know about the special pin binding but the driver
looks good.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

