Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 392A82CC5C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2019 18:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfE1Qoj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 May 2019 12:44:39 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:40393 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbfE1Qog (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 May 2019 12:44:36 -0400
Received: by mail-lj1-f169.google.com with SMTP id q62so18368235ljq.7
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mZlg4sc7q9rQDVHOh6wEBx/xKO/kmSkGgITfjko1qow=;
        b=HFnOxRV2ppzDsKKS8afYxgqriBArjzf7Aw4Gfpuee5lbPOSqcaOO4sesORT10MysFm
         u2/g6xsqlph3uXVFfQuy7b9VwEBn26e6SL43DOnYsO5FGXfUm925LNM3QeMGC1zEQXsZ
         vkhPrxQreTKYpzfv7CG7huxATqWwt7sQFmQlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mZlg4sc7q9rQDVHOh6wEBx/xKO/kmSkGgITfjko1qow=;
        b=jG7WLGcQ7jKSIooWoGIECfl5pd+NUbISvJqeMXeSHWtSkmDE6zwJ79J9qNCb3wncDo
         am8RqwQX+UA62TrpXx9PLq53ESHugnXLUDux2jlAQc7yAu7aiAv6Csgq4KcxRDCDKjrx
         MNHeqPMTXY2L9WXXdKKN6Stq/0wyH8Si78djE0jH+Wx+gUKh+qDAX+vJUMdQFRNTUamy
         Fb3q1pgqYfJGPaKH87tRUfcQ7EBv5rprXY7FGbq77ZjSe6W+tsY97lpZF64YZEWi+Y1O
         q2K/IVEaDmhzSrbLFsNk2OGB8VNxSipeUu94TA+rjTQqM3n63HFQqDYOpK6nII6wmjhh
         8zhw==
X-Gm-Message-State: APjAAAXY4bDZ4A0HbJc0stm1J3Cwn86/om9cgJX5Oz9lDrrELatzcGAG
        OwdZgwTweDbYbvCW2SEysfR674hhIUA=
X-Google-Smtp-Source: APXvYqz2PcqNlIQuGo83A9899ovEgpji4LbQ8kH7c4mN767zXQpQprfjVo2SFxrjGjj0NDwW5Qjr9Q==
X-Received: by 2002:a2e:5d49:: with SMTP id r70mr68142889ljb.102.1559061873956;
        Tue, 28 May 2019 09:44:33 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id e19sm3017302ljj.62.2019.05.28.09.44.32
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:44:32 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id a25so5272437lfg.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 May 2019 09:44:32 -0700 (PDT)
X-Received: by 2002:a19:f60f:: with SMTP id x15mr12198921lfe.61.1559061872401;
 Tue, 28 May 2019 09:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdYFqcu=gz57H-+h5C3g_rvD-+XoRTw_A86PKDVA3=rfJg@mail.gmail.com>
In-Reply-To: <CACRpkdYFqcu=gz57H-+h5C3g_rvD-+XoRTw_A86PKDVA3=rfJg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 28 May 2019 09:44:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgZBfGwnyRGjziYvPMssSf7XO+7L_FTGfkR9Gz031VAzw@mail.gmail.com>
Message-ID: <CAHk-=wgZBfGwnyRGjziYvPMssSf7XO+7L_FTGfkR9Gz031VAzw@mail.gmail.com>
Subject: Re: [GIT PULL] pin control fixes for v5.2
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 28, 2019 at 1:44 AM Linus Walleij <linus.walleij@linaro.org> wr=
ote:
>
> The outstanding commits are the Intel fixes [..]

Heh. Swedism? "Outstanding" in English means "exceptionally good". I
suspect you meant commits that "st=C3=A5r ut", which translates to "stands
out".

Or maybe the commits really are _that_ good?

                 Linus
