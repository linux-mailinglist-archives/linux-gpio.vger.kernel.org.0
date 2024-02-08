Return-Path: <linux-gpio+bounces-3065-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E2884DD25
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 10:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F58E1C26A53
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 09:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B1B6BB58;
	Thu,  8 Feb 2024 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XvVmf/1n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0FF6BB42
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 09:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707385149; cv=none; b=HxIwC82RVs+0EGfeWSfLFDEgQNhdYBbnaGOgzUenPFRRQfbRIZgSfVAg7IKMmCaQZYfPWBXY5AhefRuCnaFke7FxfpzUHUmpy7vSLV+5jfP5Crpijg2VwrNLLTejGgZFuE1AVvK6lNbL0na4O3mUntz1TQAUhU+Vkhlla2TgZLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707385149; c=relaxed/simple;
	bh=Sny5SuUsVI8atYqqphegc1gpp5T+LtTvGDD9J2PF+M4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnW+YF7wU4v3GejDJ0GToT2A6tqSpRDwVAvqktWENQY87XCpdy2Fi/HwqxfeuLlGcORZ0jj25LHc2tltxGC68gY6PYVzDXFmeey9acCsvIqs/+K7FF45QixiojHEaENDMf+kuyxdr9o9fDelxmjPvP4kanHzIEsPaOgBeODHl80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XvVmf/1n; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4b978e5e240so667114e0c.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 01:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707385147; x=1707989947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sny5SuUsVI8atYqqphegc1gpp5T+LtTvGDD9J2PF+M4=;
        b=XvVmf/1nZFbv7r3jX5s/M0vyx6MiwZYrNYPdotUk9TBOdy3y2ExJplDZapqupVhmIV
         ohGjH6s0erz5Hs6z4iTqQuD5BqsVTnUy/JyKQdbcDC0HpJoWdw6IWJF7jSY5G0vaCElr
         eDAUwQpe+NlKANyZ0u4bL/qdNWTrJEu3vyb4UE+T6kFjLzynV4OJ8h286CKWtm7rUgL+
         Tb1sz+mJL/QkjrlCYzkirbrocN9JVOt4TOE7Q5PZ9grVp1Z4mqoDm9cORqNfwDxeVdCo
         sOr2pHua6IKw/29UsIC98cck8l+8nLM3JOzuzQyNA9gta1tRawyo9+TKs99tj3oGlbp8
         PXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707385147; x=1707989947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sny5SuUsVI8atYqqphegc1gpp5T+LtTvGDD9J2PF+M4=;
        b=MUM08eSUiJo/W2JkbWhC6UZjjH0+WpvAfaRSD2jDw8oEt6/FO6gpWCinliqXpf7etB
         hcdq1AfNnO8vfS8A33O94CF7zgnqQuNd/RYnTizB8z+PepKqNzzHn7XCzTE5DNwS79Sk
         9xcp5O9SnY5ciWMDOyzIQVCcdCX38hlaKzKwE6nTY0QXZY5rj7hXLW0gHmporWbr1Zki
         QhO6IqQyZ037uYIhSG15EBR7/ji/oFOKWfGfBhcwvDRz1KeG24gvmGkmOgHRwvjmQvbX
         6IUmtFQ0i9QsXVOC5iXXn0v4atWvIb6b6dPMtMPW5RhcyT+V3gFzTUFdWVL057GH0ldQ
         gRRw==
X-Gm-Message-State: AOJu0YyPTUF18DzfpHWkBA2XNL+ndH7xo8NN0VKv4a6+nqbfEBmdOypl
	Nn27vZUL7KHkZZvZOsDru445TEMzpYJWBtiL77aTzcpU+ohs9vlB4iPmJPLWP19JA/ds/CRYZiA
	E72NiWGw1FNYC44yznf6lYzpMzPY5xuKT1jWIjiYso4Z0XBiz
X-Google-Smtp-Source: AGHT+IFUez3CnqGQlqA3KfMvqOutQYj5rGN5MK/NThGGpDKLSDVXO+5cWP7waHFECsS81Pn+Wf9sHClUhmALDsS2Iw4=
X-Received: by 2002:ac5:c5cd:0:b0:4b7:3875:72d2 with SMTP id
 g13-20020ac5c5cd000000b004b7387572d2mr4666662vkl.1.1707385147243; Thu, 08 Feb
 2024 01:39:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205100811.41534-1-brgl@bgdev.pl>
In-Reply-To: <20240205100811.41534-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 8 Feb 2024 10:38:56 +0100
Message-ID: <CAMRc=MdWBbVeuxU9XO9xbcgnBxnMnAMXRy7TXU7H9La-QyD9yw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: set device type for GPIO chips
To: Linus Walleij <linus.walleij@linaro.org>, "Ricardo B . Marliere" <ricardo@marliere.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 11:08=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> It's useful to have the device type information for those sub-devices
> that are actually GPIO chips registered with GPIOLIB. While at it: use
> the device type struct to setup the release callback which is the
> preferred way to use the device API.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Patch applied.

Bart

