Return-Path: <linux-gpio+bounces-24780-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C04B30F09
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 08:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C91F817A3ED
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 06:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2422E54AA;
	Fri, 22 Aug 2025 06:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBjdkbX3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF73742048
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 06:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755844451; cv=none; b=IsFgJTQ5nrjWqvC2YdEmApcj5GBg9juN5Vn3qHGqW0qbkje62+OOz1SZ6hC8oTgIKW7MGQDzzrDrys3U8fWWkfO5GGxLN9RupCwbiXhfkz36c1BxTJGQYFTwddLc3gdhcUcdGYtTN70RxDWn+z5WCX5RoHLSxb7ZLpU4JtIYYa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755844451; c=relaxed/simple;
	bh=APyr1jzBNkUE6kYgR8hps5+sjfTNYEMaZvm568JG+3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPIjj8Rq9gLinSzkXAocIsZLDD6OIifFnO6KbDflhAOf4Ck1UdGi/awAlu9YMQ+fhqJbnPhXCDSy6EyvVj654E+pqHGTmBW4bIzBaJy9Az+KoGZE70g91LFeZSpNKngdQM6NXMW2WsUMqa1Uc+g8L07fpMs5HOrZa/o/+EovxO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBjdkbX3; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-333f90376a3so13191261fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 23:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755844448; x=1756449248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alEYmNiGBkY2qsz79LsRvnZahIqJmxuApd8+f6+6LsQ=;
        b=sBjdkbX3IVCbwipoSQdQOz8Hk+B5i2jIvc5ynyaaeEnlBRGEVuf02Vals8yo/05wK8
         t/v3pXZCrCcR6nbnTXOnOCtW1tiorUwaqI00C2BoqPDNTk5O39W9BQdproO+PM+elvLR
         YN/qA2HtFTLnKMwxvXfIoAs+oBDn/PFg74XCuuzLFCIg0LSC1bP8Q9BWPkeUWQ5EufmK
         EJw/ABcfAe3LNZMbMHEzqryY+FN5lXuGVdYiityi3C6LommIeZ7Si1mVVkaAd7BhR122
         0X+7x+3Vb5abDKfTMbCwg6PKGwwYSnS66fS9eZsqvriNlaeRki/afpGxIQGZg35lMG3b
         5z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755844448; x=1756449248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alEYmNiGBkY2qsz79LsRvnZahIqJmxuApd8+f6+6LsQ=;
        b=GJeZkfaQ5JXnnBGiJoLvbfjkeUaEwYjaBldDBO3Yfm1OpAn1P76JMg9qAldoWbcTh+
         DxgT150pQyp+eqC28kRt9hyMpcuCgi8er02ki009dNzXuGx/szs+6+lOc4YTATfMmRXC
         CMIIt/Jwb+mXmPXv+Jcgl8VoqVYw6xsFKQ54KMifUUI0q520zEX2Lv7OtkNRGNdYN0/f
         XnoowuP7ZXoTLsRxH9YPzXHPcwYydiHHRUl/2aEwbYGm3xqH9gsp04mYPORxjqAgxIhr
         tjLWe9HdOgjSUKvB+5YLGso1NyEaEa8nD/axNlDfWWk5/SGEgG8Tz+a3jcxtaVXipjT9
         0Bjg==
X-Forwarded-Encrypted: i=1; AJvYcCVOcDTf0WUUD0zvcw0wCfIA6bZQAbh9o/ZOMqWH0qXHc+JKASvo3JkR+cv3QGCaQ1RbZJDtlGoLzltS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4kYDWQ+AxYEhSB9uTCt1S0MwF27bEJB0Fo8upXcfvdgvU0Hk/
	ceMMMyDyrsc1VtAwm/dZLAynK+3FnVpkDqWiggzFfnOcstho040ZgnrUC8DFo9aA+iiDI0xyf1K
	kn3dr7NCoAkBMlhSCedKD6r3xCgiSpkXAV3WVuHcXBQ==
X-Gm-Gg: ASbGncseCn8pCMDASJVLMCox+ruzZgwRkf4YyqB4Hj2CrV02+NBT7R65L9sZrAOWKY4
	bfUNsbUDpGVZEWV/G9oXMVrBhvWVJ52H+H5WYcKi4tqvYI+2OeD/Nhcr/I8uVjHH1whc3YCIckt
	szt1BQ80bcSCm+CsUy3k3rXBSm/6XpWxgZBewOHjUqC2GHISf+hh1ib6uBYfGdoZ50b0O8blaGK
	clvofI=
X-Google-Smtp-Source: AGHT+IG0iE4XDR+uMMzD72BpDQqJhtlUDtczynI9TNZi8Im20txtjl3MNXDXfSeHDFva2qlE13vmOtMmbCeR4Ijgf+0=
X-Received: by 2002:a05:651c:19a0:b0:336:5037:ee0a with SMTP id
 38308e7fff4ca-33650f35fc7mr5944201fa.23.1755844447769; Thu, 21 Aug 2025
 23:34:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821144942.2463014-1-superm1@kernel.org> <CACRpkdbzsgbTMiZfBHgQBsdkfH=Qhr798XLReGB7WhXLsuFrDw@mail.gmail.com>
 <f672f4c4-0f11-49aa-81ee-d72096b80825@kernel.org>
In-Reply-To: <f672f4c4-0f11-49aa-81ee-d72096b80825@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 08:33:55 +0200
X-Gm-Features: Ac12FXw8IXFIKzCUXEI1lbpEMiQEMG65uaJoP6-XAG1XfIO1IJmBzjketBQMjmw
Message-ID: <CACRpkdZKJ7BX8goR_6ik-ksDssFLQ8xw7SL06PpN0ZRNNccqgA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: Don't access irq_data's hwirq member directly
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, Basavaraj.Natikar@amd.com, 
	Shyam-sundar.S-k@amd.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 2:30=E2=80=AFAM Mario Limonciello <superm1@kernel.o=
rg> wrote:
> On 8/21/25 5:16 PM, Linus Walleij wrote:
> > On Thu, Aug 21, 2025 at 4:49=E2=80=AFPM Mario Limonciello (AMD)
> > <superm1@kernel.org> wrote:
> >
> >> There is an irqd_to_hwirq() intended to get the hwirq number. Switch
> >> all use to it.
> >>
> >> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> >
> > Hm where is this supposed to be applied...
> > My tree?
> >
> > It doesn't currently apply to devel.
> >
> > Yours,
> > Linus Walleij
>
> It was based off the commit that you picked up earlier this week.  It
> changes lines in that based upon Andy's feedback.

Aha the single line pm_pr_debug() change. I applied that in
fixes because it was just a oneliner and came with the other patch
which was a fix.

But this multiline non-regression can't go into fixes.

I will move both of these over to -next since neither is
a technical regression.

Yours,
Linus Walleij

