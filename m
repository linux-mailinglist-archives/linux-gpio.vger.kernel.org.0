Return-Path: <linux-gpio+bounces-14066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7813D9F9247
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE55C16B593
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 12:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D2121518F;
	Fri, 20 Dec 2024 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mJFBNQqG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF802594B2
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698138; cv=none; b=lRjp+xGLY7YlUN5/FUbMFF6RsCGJF5uV/bgu1Sy9fX3RPTqquUjfjp1wawocf3Zl/1R/sx08CsBSVUctsXPfw5H/kK68M1huUUnlIXprwOgcfP8aIwNGpf2CyWQ7YXOPkRc6MrtI8XPFQ1xWlQqo9nCmoPwP40MaDpTxAVlzXf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698138; c=relaxed/simple;
	bh=xnoX1Yaz4nyuSg2pnMuVCCxPPpizL/71mi0FwCn5VYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4fqsBZQI8lmqS1kod6QMRjjxQ0YBugd5t5YAobxZyvjZeFCGkOvUPNmFfpIOorXacsev0Sh9+vJsRDLWIPC1W3un30otzp334U6kIJDUVcD0wALwb58p3ihchVraZrzBfqZtTOjpCpm4KewRmg8wR9NbrvXHV4Yx2xxZay6Lh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mJFBNQqG; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso1524644e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 04:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734698134; x=1735302934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cxs0EP60NRQf4q8dFn+TEuE6v7Pg6hC++mye5M5fhAc=;
        b=mJFBNQqGQQ8dkboaSZbhIEWrGLehjjVne3PLIZkdm5lI/6qnfadX7CsRWTim9Mdte0
         yKQl/Nsn0wK27Um+4PShsjqeUPHpR7z69HvByf+doKqoFREceVldsPYZ+8kG8GMIXz1I
         1mE+Tezb4E6udirD8vhU2XXI0UNlqYOiTyg7WyHR3wpHzys2sGjqULC6HixNRxoINKkA
         YgGQVF5DouJpVB0BSoxrjyOh+gjNdl5amlseTIFubMKSlBxsPcHSuMcaUm9kJ+WXFel5
         riL7O2l9HYQyhb+T+pUn1jMYO38fnkLb7mcBxpNcc4vZUI0RwEQ8VVJzQlC6p6rt1+er
         Fc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734698134; x=1735302934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cxs0EP60NRQf4q8dFn+TEuE6v7Pg6hC++mye5M5fhAc=;
        b=nyaop77/wmRCfJ+F9B6buZkz6rOkAnlxe4Ie1C1vFV+4IX5gR5+B10ES5BYq7QsuAq
         RpnrSoZRFYJgxckiwCPTB75qN2+LDJWXmrSYQZitRgs4BzVrEuru8ulm5qj8JoqWnUor
         iSYyJtaesCZ+lkhHBiuqKZn2DDEY45VauoE0X6ov1/Hv1o4Udm/q7doC+YN+k9utoUUL
         ACzIF6yvvC4XHoHCkUeyVmrDTD0DCulGUmsYmCEfLWX0bVtpArVu/SfrLkSiwe+mpZAH
         OEm6xRELCJ/U5agmJxb5moeqUUA5kRpbQPCfT6QxdMNHR7jKpQk/hUKgfgetKa9lWM0G
         7vaA==
X-Gm-Message-State: AOJu0YyYlVaPADfAVwhdomb1TNdruPmUxjwsAu6RFU9JctTIScFw0HJv
	LieJOz59WyxGDebzgF8/dxna16M4ADbjXxCUUWc/VUiKakC7FbPjBjNopZwH5b5a0KOQj9Vtt2+
	F5vE2pW/MIRjUK8iSv92Kfx16dtFjTs0cs/xxaw==
X-Gm-Gg: ASbGnctgvlKsU8KeTl6K/jLAUSXSuUioOKa3opoPMqKF0XEI0RRP1VWkxhPIoOgyj/l
	NHgai8VUa7YqDD+/AGfejnDNXz46B/i3B+/MGvA==
X-Google-Smtp-Source: AGHT+IHRxAcFPD1TvJeiUzihMypxoNDL/b0/lat/G7rTcOZHtO8aDwn2pOXXyHqw7Dz8MNlDsZHzYk0r9N4CZ6TtzHA=
X-Received: by 2002:a05:6512:2394:b0:541:21f9:45b6 with SMTP id
 2adb3069b0e04-54229562a7bmr962076e87.37.1734698133684; Fri, 20 Dec 2024
 04:35:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1734690011.git.geert+renesas@glider.be>
In-Reply-To: <cover.1734690011.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:35:22 +0100
Message-ID: <CACRpkdb==ZaxGccrTZsay_jON1sEWRA4wVgHMG3c6VaSqmRiDg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: renesas: Updates for v6.14
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 11:30=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/renesas-pinctrl-for-v6.14-tag1
>
> for you to fetch changes up to 03fc60cd8e7b7e6f330d0a48c54545740addd9d8:

Pulled into devel for v6.14!

Yours,
Linus Walleij

