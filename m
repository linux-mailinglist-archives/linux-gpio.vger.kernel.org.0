Return-Path: <linux-gpio+bounces-21758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E62ADEBBB
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D900C4063ED
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0502E972C;
	Wed, 18 Jun 2025 12:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bi5SETsX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F872E88BD
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248941; cv=none; b=BJXIxq+HsrIIee8hX6mX4dxaSRB1LLFjvTo3As1uByk49XclXf3hyI3MFtoYpO+W8wINo8C67pKcisRBjLy6bIQGn6Wfq+k8QcX7JmhUZLx7+8n6sG3nkQQ9eo2fh8LbbrjrW7DKPFKHvYNrxIWo3f1GhK6yWRVc0dFQ0Xvl68o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248941; c=relaxed/simple;
	bh=lbSUV7iMOG8RNQJT3FC35YbqTkiHR5cFo6h4VEVJFKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgSs1CiHzXNOmwJ7Ell43OArmbWMxB0rxvo4EBY8zfHl5DzXviIirrqcv89xiuglTw/NI8QHMF+Dce1wLihN9k9MGZUIdR1tIA1LxjtDJoPWZtj76ywSwMqopankXBI7YeG+Xb4cZLPHh6SPH0WRBR9EC6RRfYpIzKcSZqlGmdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bi5SETsX; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b5165cf5so5795692e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248935; x=1750853735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7jZQ+YS+lWYeVwEC8VFaNnmqDYcJYXkLsLKJpyV1y0=;
        b=Bi5SETsXaZyYbDmid0EWLlL3xktYeHJlZSMiHdCtPPNPtebLdK1+42xog67UGixoC0
         +I/LtbApMJ36ENhn69yR7jNiKKPIt3AtorDwu7wvj/8ral4ZZcXx88LDQ5Nk5TDy5ZfT
         J0Tv4J20P92OhVyD7B6TZB3DkBkbZa4P0MVyRyFs9D0SLPDV5rlteylJhvxTHOGQOWnD
         I/8EFHi+sVhlFkZ2WwEYDwEhKXV2tvzHZEyZmTqla4ALbrvgGEnl4pF9jUFFI7OpoihX
         2N/l2mnFpIdIhp4+kiWcPU9oWSW2IPPQOkRggoVITHWVswIHF4xKgO7wiKIaxFH7ytHB
         kkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248935; x=1750853735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7jZQ+YS+lWYeVwEC8VFaNnmqDYcJYXkLsLKJpyV1y0=;
        b=NkNuO9Abewag7Cb0g9g/RYyYvnuGUaWegA8L4EvKSObKu60Mj54bqq1cOVigjtudSt
         uYtRUBdviNYx579hmDQ82wxB//LjhBPy3nA5tQLLctGH+H82FZp6QJxQO5W0ekcaEEKD
         +8JzfKwAGz7q/t+x5MMFGRzbDwQfRgyM8V1mkpE5ioSdXVdlfmDnWWWDfjyBuAibtgXr
         6bZkgRuw18LY+018JK3FT8DrnLED27r+W76oYQckEpmi40R+DROXTVPkOtofpvH2lRkq
         Zekk5ER0QocX2svkG2Cu7dsWd7ivr02D2F/1YfxMt+R1vMkOC+MuHmqfkkVTeIe+ROvs
         KMsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwQBvYeSwP85gcfeCJCoU/MYdT6Phy2ozDNAwZUmRX0pcaHN++9bNSxntIoRh6LYMe3NwbU6Kt5Fr6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+g0kckq1QLm6148iVtVxB3v7KnfZcefQWsKGSx91PkN+7/qte
	dL/gE4LJ/XkVPxAqzO1hhKHFH6Berl4amV0VcdqYiSKA4QodbrdOg9vnmGJKTyLxcKl444MHsdl
	rDSr8gLtHEIoPwxPJoeqnKXBnNbeapxHxED3v1p4TLw==
X-Gm-Gg: ASbGnctWYWW/Y47s04yhwcToyjbJLbmXhLEghqQU65uggg27cl31seEFA2NZmmSMkX3
	9TcrTt29KJ3j0g6GrPEP+55O19DHe2HdasXc+eJGQlJEOAdSRgLElxbc9V3cvtJ8ASEVw2fndHx
	D6fkCamIhuF9bpoTcQdawd3cylFNdKhJL2d6Zz7DSrw74=
X-Google-Smtp-Source: AGHT+IGBMbnQS8CZK59QUADw6V+D/mLT8w6YMYDnxWivA5Amu6Cgv0XDSbL6jWX7zdVZfzp8QG5Ih8L/ToZVwFJNik0=
X-Received: by 2002:a05:6512:1285:b0:545:6fa:bf5f with SMTP id
 2adb3069b0e04-553b6e732b1mr4223465e87.2.1750248934811; Wed, 18 Jun 2025
 05:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com> <20250613033001.3153637-7-jacky_chou@aspeedtech.com>
In-Reply-To: <20250613033001.3153637-7-jacky_chou@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:15:23 +0200
X-Gm-Features: AX0GCFscY4ky5ebft20JokFvuO1y3hVcQ04FGalsWAeschf7cTa_SUmnKoC4ETU
Message-ID: <CACRpkdaX24z5YsfcrB2oqbZpdexZJNREGkWiYgq1ar0c8O0QBA@mail.gmail.com>
Subject: Re: [PATCH 6/7] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org, 
	kishon@kernel.org, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, elbadrym@google.com, romlem@google.com, 
	anhphan@google.com, wak@google.com, yuxiaozhang@google.com, 
	BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 5:30=E2=80=AFAM Jacky Chou <jacky_chou@aspeedtech.c=
om> wrote:

> The PCIe RC PERST uses SSPRST# as PERST#  and enable this pin
> to output.
>
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Can I just apply this patch 6/7 in isolation from the others, to
the pin control tree?

Yours,
Linus Walleij

