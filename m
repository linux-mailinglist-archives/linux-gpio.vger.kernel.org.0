Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2753D8175D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbfHEKrq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:47:46 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45811 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728360AbfHEKrq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:47:46 -0400
Received: by mail-lj1-f194.google.com with SMTP id m23so78807251lje.12
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 03:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y8ev7idhhRdfNKj1s1Ry4AVA7oMVl5Zr3nXpss1zKaI=;
        b=ciULGFpaKJGyGIn8DOiYc74jQEChvVXjT78X89byv515QioWQ8LKIbfQAuDjjBHX0u
         2v96i5afuwQhBnrogqn47DxIdQ6IXLNkLuZlMVG4x6a1f5+CocddiYovSrGgDzIeaYl9
         eh3plobRFsDauaUG3bJ8BELTRTjE8G/gGmjrGwh7GJiYkb3tJLJcGkGeVT1dsHYihhl3
         GYFXPEWHP48uVedVSlamsufiFTMi4tv93b+CpDlI5z2Hw/Ov2d5mulyYBb78YzfeZOVC
         J9cIbZmLoNriGN4BVqAx2ZWMRZuB77qLfRD3VaDOLL88RFAs7lNl5JDiiDfL67UkuCtD
         u1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y8ev7idhhRdfNKj1s1Ry4AVA7oMVl5Zr3nXpss1zKaI=;
        b=RgRGLLq84m0edPIRWpK+o2FeAfocRFq8QRWHHJ+MxWmo89KgbFPoiB2aZK8XyHkScr
         8ZrC0dvnjT2xysCShThCRsiI1ctxIaF0U/EisY7oPeNHhzmtjdbRNXiScZafaoTddqun
         QOJSJkfIshHedpGI7Klg9ooWR760660BI6RXQhKp6/NNH4ndY3osOfRA6puA4opJ/S2i
         7mH/2Y3z+tRSJpI0uWyXmyrwJym2Jtj9hEm1hCpeVMHx+rNKfpHdreyEvBFOmvDm4Q/a
         UOkPM7Zod2VvMnutBSZxFNzOsYEeZsl7jkE1e5Um3V49JsofEnCMbq76aQ/iSZAnMYKw
         dnyA==
X-Gm-Message-State: APjAAAUmvQx7C6j/Ol2S4kNYcpG7i+SujUTIMW8UhEEgAik491Y33tET
        8psuomYSdsh3w2Rf5u2+Y9br1qbxvOOd7SqzfW42Mw==
X-Google-Smtp-Source: APXvYqwLJr3uamyVrePIy7GYeTGTKZVVFmuCgCeDV0lQp/Tg1tMYwqSStWcsZi8QVF2EtXjzVZWC8D1lN3Mn23V8cVg=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr16495379ljs.54.1565002064570;
 Mon, 05 Aug 2019 03:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190724081313.12934-1-andrew@aj.id.au> <20190724081313.12934-3-andrew@aj.id.au>
In-Reply-To: <20190724081313.12934-3-andrew@aj.id.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:47:32 +0200
Message-ID: <CACRpkdYoiWwm7SeXxWgpJcoiRcNV28CDC3F8FVx5my2Q0KSvvA@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: aspeed: Document existence of deprecated compatibles
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Otherwise they look odd in the face of not being listed in the bindings
> documents.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij
