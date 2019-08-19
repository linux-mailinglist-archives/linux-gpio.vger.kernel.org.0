Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B516A92616
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 16:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbfHSOGM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 10:06:12 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37545 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbfHSOGM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Aug 2019 10:06:12 -0400
Received: by mail-pg1-f195.google.com with SMTP id d1so1295358pgp.4
        for <linux-gpio@vger.kernel.org>; Mon, 19 Aug 2019 07:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=tWZZibpcMlZckZiNvVb9GM6xcQ7fYnmS1jnRF49yzOI=;
        b=EiHnZl/7DvUWyNuyAnCzmL9zpSivziTgkeY1yFuWlhjp0i66vGEUZ5XfK1BkL9Hyw8
         nGfq/szLT4ZNVpSfxACqCWhUHskG0TNGvAT2AfWIQNvMy6cSBG+qkuLXMlytX4dYRsL3
         OeNfWiTNMWro3YXusvrD1twPtn1BAGtzxR6z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=tWZZibpcMlZckZiNvVb9GM6xcQ7fYnmS1jnRF49yzOI=;
        b=k2Aj6yt1jbDE/3mMt9EWeaex3QDXLGwYWhZDtgXMMsZM1KlKg2uIjCTq2Aog3M+ywD
         Sss7kXpPDs2rzBtTwxGAg7m3yOrDubQlUwHFvUfCoVIKFZvQOJMq4a3d09gDVSA7fAbN
         p+yBR2qiUtBjE8N8o4Io+1VlcroSQcZaKaH172I9ubwbPdURl9qLDKmE6YssQWA7LQ2Y
         f3/o1BooprhBG0h59GGIFPJlUYLWUjoqVwmWr9w4BVDjaymbHivoqGuA8XYDhZgmfOv2
         vblP650HLdjFVN0GYddMzWa1AwMxbQ9f0X12GZOLUQRwXEjZEUtxdrl9loWa6Rqbvo9g
         Jf7g==
X-Gm-Message-State: APjAAAWX7lPHsQ36CiUk9viLg+scQZxOIgt1cmcILMC+vQzUl41C4QcD
        Ld8h9ra6RQf2TRNhsF0Wtcr1BA==
X-Google-Smtp-Source: APXvYqw+ZlbwAJMI8xfFRPH20Npy7KaJK5lSdinvpdFZohk2L7G7MYv4RCLFaM4U+15aXN8af4LakQ==
X-Received: by 2002:aa7:8d88:: with SMTP id i8mr24639179pfr.28.1566223571933;
        Mon, 19 Aug 2019 07:06:11 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h195sm22595980pfe.20.2019.08.19.07.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 07:06:11 -0700 (PDT)
Message-ID: <5d5aacd3.1c69fb81.6abac.63e5@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190819093058.10863-1-linus.walleij@linaro.org>
References: <20190819093058.10863-1-linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Use callback presence to determine need of valid_mask
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Mon, 19 Aug 2019 07:06:10 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Linus Walleij (2019-08-19 02:30:58)
> After we switched the two drivers that have .need_valid_mask
> set to use the callback for setting up the .valid_mask,
> we can just use the presence of the .init_valid_mask()
> callback (or the OF reserved ranges, nota bene) to determine
> whether to allocate the mask or not and we can drop the
> .need_valid_mask field altogether.
>=20
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Amelie Delaunay <amelie.delaunay@st.com>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

