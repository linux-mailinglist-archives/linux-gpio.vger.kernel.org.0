Return-Path: <linux-gpio+bounces-6953-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CCB8D4CE6
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 15:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A510E1C220C1
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 13:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F52A17107B;
	Thu, 30 May 2024 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGoum1wg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2B917C203;
	Thu, 30 May 2024 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717076259; cv=none; b=H7GiU7flwl8x8edv7m8erbJ2PsGNwBLaIzhzsEo7Rw8/icnW6dZzu2ZsIikHInaZGFJelSnggIuDLOnI0O5tZtlcO4ww4EWnV+OLvDYhJP6DzqpTRHvs2V9G5qPSCmowOjPsZLAgbA0a9F+otffYctjAuDzYdhcY+pWDmKT1uy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717076259; c=relaxed/simple;
	bh=oqjWBx6PDbgINMHWnjQpfH26p1ixUJktWtD7O9TLhj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3ehZkDmb0cE9ol90M6npLItSE+nc+aaNBfatgRMik/vqBpc146dWHPv2srHViN6GQ3EENPy1VE4yn6iBZhzUEyqWEwqEj+tAyP+tM310uI8KwtKWkfE9iy2Deea5wx+z/TkAPyrHO/zpYtZJnBhHHX9NaoQSeyjj821lOEyggY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGoum1wg; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ad8230bb9so993133e87.3;
        Thu, 30 May 2024 06:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717076256; x=1717681056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqjWBx6PDbgINMHWnjQpfH26p1ixUJktWtD7O9TLhj8=;
        b=OGoum1wg3dxy0uS5Gsszzq4vDgFnWMt+J54/n75Av+nET9iAKjfzMkg8PsKEirRoBS
         zpumgU1BUxzA4pONd8hnwpIv4heX5AdeC6hWhZuunJAfKU7xDIah7ORZbIf3tMn7gNv1
         empeDj4j6db2C2b8/o0TGMIDdvcKK1G1yPFK6rUr605m25KLHzbq3NF7n5n/k1V7nbp9
         3k/fw9AJ8tKMKGmhK6wDACbh9v0WN4gmQfoAM7Uzl7OJqZCwuUlV6OPrjbDGMt29bnm1
         qByeOeBu1Xt1C8/7R6dGk08auefeggcN++cB1xZkEHQqie/gkPTaUsDB2gmnTokqphBe
         tKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717076256; x=1717681056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqjWBx6PDbgINMHWnjQpfH26p1ixUJktWtD7O9TLhj8=;
        b=hFFU5HsdWyKdigY4YQDdqh4xjt+7YGyAI+o+5bzCD6PhO6hKhr6L7EZ2gS1Ul/Zji8
         4/DPPrdp40tmYVUNu/ZcsNnPhYl3QX5nAGftEDXlTYWcy0sRju4+390TenrPhD7aJKQE
         myVKHTW+O2fXwn48C09pC7544bzxDWHNKY0iD9d4UlnwlAoXLaHaM6K4lhebxB2dSiR4
         J+Y9Ur8YZhZHGBhfiCEctEGqNWMlgZT8eQ4gOUjtu/9IqgKg8JEalPgJJZ26atFJ4zB9
         rQI+UYDn722iwf9PsNS6S+ybDth/0gY2c0uuE/y5A2/jxQDX7loea5Y04lQBx9wrcRTU
         /hlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhRREuYIKiXZc8tD8uTa8aSgCuzru/NK0ubW3xN7bekvwkN1MhZdr9pXL/yCYH9SsWykcT1qG4D9BqRDl52l3Wa/d5Wtete/jFp0Snx+ymuLpbhsL+J4aeqo0/WuMZSkk6sjiZF4LeQbenET8X
X-Gm-Message-State: AOJu0YxgMsI87H44NHUVrxhqr0h2knfUsVgu3/10fpWhPlJfW+eEdBzv
	+h0BtsLsU5RH/Hreb6hGZq021unNgCiBQdAbuzWhjy4hmqkapSBrVY+b5oKZ9F0knRPHjEMjQf7
	LKH8hQmRBCzEF16JbXyyvhem0v9uJNPRg
X-Google-Smtp-Source: AGHT+IH6Wk+7Pxtnc7LbHEUnBVnJDrQiQxm5LEV/2kvexa+KpwwWI4YfEvVf+XgRdSH1//HZGctXD+Jk6g1uF582pzc=
X-Received: by 2002:a05:6512:48c1:b0:529:b734:ebc9 with SMTP id
 2adb3069b0e04-52b7d428b76mr1502110e87.38.1717076255424; Thu, 30 May 2024
 06:37:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.1717060708.git.geert+renesas@glider.be>
 <ZlhGYFM6iVlGjZk-@surfacebook.localdomain> <CAMuHMdU6V4Ooit7P5pqUFXOZawiZj7TjXY7t=KVk84xPZ0PR+A@mail.gmail.com>
In-Reply-To: <CAMuHMdU6V4Ooit7P5pqUFXOZawiZj7TjXY7t=KVk84xPZ0PR+A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 May 2024 16:36:59 +0300
Message-ID: <CAHp75Vd3ke3_bxwsxzSVzjnNW-6aYDTYHvZ-+B9nJtAJR1fX=g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzn1: Use for_each_child_of_node_scoped()
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 2:52=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Thu, May 30, 2024 at 11:26=E2=80=AFAM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > Thu, May 30, 2024 at 11:19:29AM +0200, Geert Uytterhoeven kirjoitti:
> > > Use the scoped variant of for_each_child_of_node() to simplify the co=
de.
> >
> > I do not see the point of this patch. This makes code actually more
> > complicated, and I'm not sure the code generation is the same and not w=
orse.
>
> On arm32, a conversion to for_each_child_of_node_scoped() seems to
> cost ca. 48 bytes of additional code.
>
> BTW, the same is true for cases where the conversion does simplify
> cleanup.
>
> I checked "pinctrl: renesas: Use scope based of_node_put() cleanups",
> and all but the conversions in *_dt_node_to_map() cost 48 bytes each.

Yeah. so for the cases where there are no returns from inside the loop
I prefer not to use _scoped.

P.S. Thank you for checking, btw!

--=20
With Best Regards,
Andy Shevchenko

