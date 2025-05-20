Return-Path: <linux-gpio+bounces-20357-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A2ABE171
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 19:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B644B7B3319
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 17:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BED270570;
	Tue, 20 May 2025 17:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mmbT9233"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7189C268C55
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 17:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747760519; cv=none; b=dYIU/X8UBcLwT+K3dFf0DMfbrQCZKvE3bXk5GVV8Cwc9nP0kikvLEnAjnHn3kN22kOd9wzaeaa9iFC/QDjV6qKw15FU309ZJckTiyUHP/KnA5vStpM4gj4b9hTn0c76Jel0pGm06H3WwmZ47AwwMKDZcVxWCHXABlGidpJCAoQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747760519; c=relaxed/simple;
	bh=xZSsRnGyyhGYsnjsOlnRkVM93KYOI+VXorAm5KVz+YA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MfAW1oV8G+KNcVeUR2jTlDjordVsCmQlLyt7IjBq0kLr+38q93IwOdZBtB+OibAGGL/pyV2ToA/nKRKUj9eOZxF2+vj01Qxyub6NgeWa/z/g7oI3R+e0a11Sf16YwTmGuvFXR9iGqI6sQo9nWktE4l9EOXWAnHvEe9TSZMDdVu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mmbT9233; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-550ea5df252so4607452e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 10:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747760515; x=1748365315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZSsRnGyyhGYsnjsOlnRkVM93KYOI+VXorAm5KVz+YA=;
        b=mmbT9233GWoptDKlBIfgO4eJ7FsGvK0jq2kBwKwcafGEENTY62KnK/2lxqGkiCFWa0
         cNLL8iSHSRQ5/vZgYUYZleYwFuEFgonDKzd0n7oS1fIVm0WB1V8afG8S5RwidQuxF8J8
         8zLKsjP1b91lrCPPylH+ci0w2zAhDlK1CBfJcyvwo0yz5jUEkqzkcvtCWVF7CF5Fiab1
         YD90Xi73PZaQMPIdugfzTH6fYxoLN/gDCDxA4/Yq/7xF6gyZf3xFFj+dhiarAISrvPOG
         vc2JbX2PsZs1or5FaE/tiI02wjfOyM5FN8XTzNOSonz6mkfTSaMx+RX2zoqvPXven8Ws
         gs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747760515; x=1748365315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZSsRnGyyhGYsnjsOlnRkVM93KYOI+VXorAm5KVz+YA=;
        b=DF7w+wHJsKf9VL3jw1GcGcVW3F+TD/iIaaCLBMsaRBjGfbP0tuxJhVoY6mNi/dNM/f
         8qFENX8C2tklnrb6Dq+i6Nm/M5CmUDCbaTfYVbg1etY7crGHcGp1b5ZLL6cfkOhpFyUF
         qL/QUDNKlBwZGLr+8tWRfuWLs17+bbqq7fbt7V5iOWFV2IU0INOnQ8aBC70EyfnT4AFi
         f8EdDe5wKO0S1f2QlfaV0Zq08svPmm5VpQLzkeBnjEUigGsfbes83f1Tdbvln8Ggq9vj
         wHFWo+rGJKEqoxN44MxP9Z7667J6se1enZ/AWqcFe8tbbBvi4x65tk2TaET2/vuVC7DW
         CMRA==
X-Forwarded-Encrypted: i=1; AJvYcCW8/xNpDQHGShBbdszG/AOmUrERoWFm8/IeAxqKkrDDaD+DJzaUA17kyaeyyMFFz9RjiOAizVBG5tqv@vger.kernel.org
X-Gm-Message-State: AOJu0YyRs1COsjr9osPQVknzO6+dvP3hNLKyIE1MOQG6AX8JLdSFThIP
	BK3MYe5uGX5bshU2yUfLjtIzIR6K6OY/OViaW2ktHMiR1QipqUYKRU5yGOIISzUd593dwTJlN8O
	zYTe+UUKAHpggDX78cAUJrIQLz8YSlwyn67VqISqXUQ==
X-Gm-Gg: ASbGncvSe3Ok/pephf8MeWQFzYle579eFx+QdTup/PR8K2s1Yu1xbcQ1uYcpr0XWp9h
	yd7X/rICV6SCcqMpuMqgWyv6mozKfO5GFIYomcYHH37DaizN48yf7emPM25zlI6dyQsWfgevvh7
	aocIaXxHM+PfBejtVnWuXd5BlCeMLAZGaBRq1KZ1fhxzCnZaWEeGdkWTYgTfsjSu+V
X-Google-Smtp-Source: AGHT+IHGcton47b4SRlkezOs6A+p2hCe+G8w/Zc5+7fPgaeeCngttApkhFVS65avmm4vXQkmj3B+o9lmsenLqXUl520=
X-Received: by 2002:a05:651c:31cd:b0:30b:ab00:846a with SMTP id
 38308e7fff4ca-328083fe2edmr55164311fa.3.1747760514824; Tue, 20 May 2025
 10:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
In-Reply-To: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 May 2025 19:01:42 +0200
X-Gm-Features: AX0GCFvExND99g3-ocicUC7hcVnJlz498K7QNXubedp0La7I2nGUrjQyAJvOsTU
Message-ID: <CAMRc=Mfpvh0jyNsOXj3rUf8bW69oq6fqt+XMf9EKunF0dni5+g@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:28=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> This is the sixth version of this series. The main change is the rework o=
f
> the GPIO forwarder API as requested by Geert to have more consistent nami=
ng
> and parameters.
>
> More details in changelog.
>
> Best Regards,
>
> Thomas
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>

Hi Thomas!

I appreciate your hard work on this feature in this cycle but it's now
too late as Linus will tag v6.15 on Sunday. This will have to wait
until the v6.16 merge window.

Bartosz

