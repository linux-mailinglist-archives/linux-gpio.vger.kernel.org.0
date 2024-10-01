Return-Path: <linux-gpio+bounces-10602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 053F698B515
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 09:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FE14B20E01
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 07:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399511BC9EC;
	Tue,  1 Oct 2024 07:02:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3978199247;
	Tue,  1 Oct 2024 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766171; cv=none; b=JQNE1yLxna8bPLxXPbA/XDIEeBjD1y3e1GHu/nWQVcFD9E4Z8j+W5PFUyNFY5iq1vg9heCFx/8DO6Bn4TpOYoP0q6NAs38ZekTm7tiyoKR5eBptj2QtI5rxfH+H4eWpayPYaGmh4WjGxEYAKYITXlcwUS0mMggMEp4GPJPPTx5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766171; c=relaxed/simple;
	bh=y3V3JtV/huRYmN2Wbts7oyJzLQsiqC51C3c+UraAucI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMburcE66gj+Ax93w6fMnd/KULwUOayVy2JsLWVnRmYAU0n6bdHOTK10HleVy3LLac/3+P7Ll5qUnVRYFyQf7a7ycrW+6Js1sx9RTSRuJQongoAdg/SE+X849JukQEwhX6u0MTrj+hiYvxpww8MQi9OZ+oPwExlvRIR8oR60avg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e25d164854dso4355378276.2;
        Tue, 01 Oct 2024 00:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727766167; x=1728370967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0fRTETpyGxqWu5DVfciAHLonRnDuYiMVewT5aBbmKA=;
        b=KRA/9XbRbHWji3Jq7cAYpiiv7poZTR9H0oBmY3GpDXUaoeRV3j/VvAP6JSyXlX2nR5
         rA2N2LTfIbg/sFXm8naoWActdSnwX58QpCaL1YRDT653KozAdhDgJ7F1Fo2OTn54URyv
         pYqgK/rJEzQsTnAAYXQ8eQXkpg652VV1u3XvpSP/kJ8sX+15N3/fD0iTusC1Rg8al4Ap
         bDNpYaZk3DcT1+5ytO4eNacz17HYodE23FACOuyyDDY9zbBrYifEuus3T4s1fe4xQwYD
         TioqtePfgMwBxx7dScxL87hQs7sxjpVvp2PrAfjXUdr30VzAyqAiZoSZLNuaAeSXLFSQ
         4qDA==
X-Forwarded-Encrypted: i=1; AJvYcCXJt2o8DZI/H84Rz9bOfZo+hYJXrreOmC2hMwU6tZtBfzXp11wc3DzPSbgdISruw0kKkIu+nS8ZGxZY@vger.kernel.org
X-Gm-Message-State: AOJu0YxblktXYDyIFlMnO0W6mNW+OR/cfAYvnC9AaeUYRNzNB/ULGy8J
	ibPTuhJD/BpM2Z7kqNKAw5KH+wb5ZtOZaC3NE1w+7gGdSoAYSRGVygkXTcdZ
X-Google-Smtp-Source: AGHT+IEevhz5QFVMYcl6pH7wQmyjCJ+hs3UP6J4q0m7LyuGQd5+SC6zggTWbZMCWnFXIIckEvs1bxQ==
X-Received: by 2002:a05:690c:7784:b0:6be:523:af4d with SMTP id 00721157ae682-6e2474f5bcdmr77925887b3.11.1727766167214;
        Tue, 01 Oct 2024 00:02:47 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e24536992dsm17997147b3.96.2024.10.01.00.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 00:02:46 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e23b300bf9so37479977b3.3;
        Tue, 01 Oct 2024 00:02:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVh8myusXXW7w2YtN6f16CZQiR2I6RM8DYZ413l5u0zBSUXHwL73oSwyy69pZ2wRqnzSTgnoWJRmA+d@vger.kernel.org
X-Received: by 2002:a05:690c:2d86:b0:62c:c684:b1e1 with SMTP id
 00721157ae682-6e2475b9ff6mr87154037b3.29.1727766166686; Tue, 01 Oct 2024
 00:02:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930191523.7030-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240930191523.7030-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Oct 2024 09:02:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkmWXq-YW45HCxUW__ctrb7b_RJBGxh8HkjJaj1VaCTw@mail.gmail.com>
Message-ID: <CAMuHMdXkmWXq-YW45HCxUW__ctrb7b_RJBGxh8HkjJaj1VaCTw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rza1: mark GPIOs as used
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 9:15=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> GPIOs showed up as unclaimed, so they could be muxed to something else
> even though they were in use. Mark GPIOs as claimed to avoid that.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Change since v1: * free the gpio as well (Thanks, Geert!)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.13.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

