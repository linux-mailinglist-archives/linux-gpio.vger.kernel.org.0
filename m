Return-Path: <linux-gpio+bounces-9521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C99B968179
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E01F1C21D76
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 08:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBB8154425;
	Mon,  2 Sep 2024 08:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UBYy5lKx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073027DA81
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 08:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725264909; cv=none; b=dD8M2CVuKwTUv4fGERS3Mt8uLY6jTFw3D6yPuLNP61Vy7LFTngF8wYi0kD0FnZy5aaNL316Imr5VZqI7uiMbff76WWWx/0y8wu/YCD6a7JAhUY4J0AW+sPQZOfjF2L2Tzo02s01UNmGXyJArsUPQKMnAkHk9b3s2LE8uNpHNCFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725264909; c=relaxed/simple;
	bh=cNHXjqKgLWMds2OgFensstlmKCOeVqEB2Hiik7pkYFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksrzSy59cFBums0EgRA3Q5XqBZ+85xKh6f6+Vu0GatFLOMmZ+Jf2fkdeB2ZNVbtzlFz4PNo8DtnUUAYoh8B6BQvY1egajN4aB+yu1wHOJR6t8Rl/0/opolv+9yLBQ9WDyKlnkHd0Qph1EyOYIFqQs0CZHhaEkc6JsKoX+5aBQH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UBYy5lKx; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5334879ba28so5504331e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 01:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725264906; x=1725869706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jrjj9ToqPLcqSegJWScldNm8STblDAUw49Si0ujiXY=;
        b=UBYy5lKxqXzjRM+8ZgjgXAE0wgefVz9JmoHY6mGdAgkV/3iW5hfNrKQbae9yAgzGkd
         7q1SjQzXM8YCOJ4Xprg9DSnHw7hVKmZcrNv4/FanMH+ab8mgxy+Rnjl4koXKi+4ziZ0R
         cnGv0/S2z3kvo+hk8bxmw/M64VR/2l2zOFFMYBPqkYplniISLk/LGTeXZV03ilPwl55R
         24g4Lv4XrkLCa7oco1+EJGfVRw07wBo1osqUGCVIlVOZ8CT22Y772d1oQ6b4jY2E2ZF8
         r5q7OCHdBzpNkinNC3IRvna0jZ2pzIn5gU83IYhMW7SQeihoFASDYVNNvt8B9xI4PbcA
         2oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725264906; x=1725869706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jrjj9ToqPLcqSegJWScldNm8STblDAUw49Si0ujiXY=;
        b=MsaTxYHRL0JhQLqoB/JV3AO2gIooji7auTnDVsHsCxPSCHHjWa4PUOo8jM+tlC4d8x
         r6zVidyFyd1zV6m/hGvH0GnWP5sJFMFnl8W8lR0gE7TrWzG9Z6G2LLwiUFGTx3dBzqtx
         O6kNJSxLP1oxi8z2Y6L72Z/VabPmf5p8AbWp1jG6AwT62zYtTQ/npOkRaUgUMRcxHnUb
         m42g8uxRbtY7n+WpXuypatfqNDTe0KrEAKDootSABgq5iLnpwpNNDsa1z1C9SrSCG4vD
         CQ1RkNZj8X5+n8zRx6Fj/CIqctXL8LpciXQunClKzOmMGBcA5k0KWJFn2zbT8xXDWvfx
         wxpg==
X-Forwarded-Encrypted: i=1; AJvYcCWBQ5TqAQD3xYn1PZsRNcCBMnEs9k69MCtqWSsPF36kxTMgIeU8HqxB5O/o887FJeSHcxWH4GErJ7uf@vger.kernel.org
X-Gm-Message-State: AOJu0YxS167Q0gNZlszipnKN6fNMVNn795iawXJ7wmu6PuXkAhzlQdlD
	jDPqeM66IJaDU6MrMVky25GHjGiwj8ad4z3RAAcmVOLLW/pw6qGQt7jV9hymc7BvCuYKStdbSei
	YDmNEzRuLYWNnc8kF7RvtJLTUbBSGlnU6CQ3rBA==
X-Google-Smtp-Source: AGHT+IEIcZ714lRv4sDFrAlbMjbnTzlUd9K/kGrUu5kdiOEEZV9QWTofPNmqjzUs2KxOcyJbrYr5+8vL79gdS78rfC4=
X-Received: by 2002:a05:6512:e94:b0:52e:74d5:89ae with SMTP id
 2adb3069b0e04-53546b8e017mr7635959e87.39.1725264905563; Mon, 02 Sep 2024
 01:15:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c8e3feeedbf42a130936a5afaea0f129bcda51f6.1724938156.git.geert+renesas@glider.be>
In-Reply-To: <c8e3feeedbf42a130936a5afaea0f129bcda51f6.1724938156.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2024 10:14:54 +0200
Message-ID: <CACRpkdaokb7+C=gYqZYR3_RO3HRPKK6AFB5O07fbzC4Xx5-vPQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Join split messages and remove double whitespace
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Stephen Warren <swarren@nvidia.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 3:30=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Splitting error messages across multiple lines makes it harder to find
> them in the kernel sources.  Fix this by joining the messages.
> Remove double whitespace (end of first line + begin of second line).
>
> Fixes: 1c8e794432c2ee75 ("pinctrl: improve warning messages")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied!

Yours,
Linus Walleij

