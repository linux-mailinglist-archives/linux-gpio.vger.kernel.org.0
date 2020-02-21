Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7971683A0
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 17:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgBUQfc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 11:35:32 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:49546 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbgBUQfb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 11:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=VL6gh0yPQIpT2nL/+Hwg/Bl1b1dNG3KY79WqjmhXwG8=; b=Lu16Wnf5xgjg6FezgS0tFqeKPj
        tlX0AdWRAo+cJ0QadzQvCTV+iqpD+UiJ1/PoWHBXN7Gh9a7iwm9TaHSyOBR+VNkDfmyAI6fN3zZ+o
        qeDro/A338xHvEvS+VdB4v/IJhZ7AULjdBU89/ts77smD2uAZAO7OrKiRAlEbjb8yQRLZIlsh8zkl
        50knhHs5T3HhvaQOa/3MWH/A1HEysEYc7nfq6LOFdVgnuQk8K8ZXmUrfIfdWMZKO6Q4bjLiRh4x6W
        fCn+I1hd+RZBkAFhgQUKthDC80MHPcJpcdn8RPy/1bp3yJqXKBlwtazHGOgzlbq15la9d9d1dnDeW
        wbqfYF8Q==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j5BGx-0008Nu-4M; Fri, 21 Feb 2020 16:35:27 +0000
Subject: Re: [PATCH v5 4/5] docs: gpio: Add GPIO Aggregator documentation
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
References: <20200218151812.7816-1-geert+renesas@glider.be>
 <20200218151812.7816-5-geert+renesas@glider.be>
 <e2530fff-a17c-ae90-ba92-360b828582da@infradead.org>
 <CAMuHMdUFV0nbfrpxY60av2x+UUN62wDiVLbcEG83133aqfFcUQ@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <98997c64-9486-ee64-32df-3172e518b70d@infradead.org>
Date:   Fri, 21 Feb 2020 08:35:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUFV0nbfrpxY60av2x+UUN62wDiVLbcEG83133aqfFcUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/21/20 8:34 AM, Geert Uytterhoeven wrote:
> Hi Randy,
> 

Hi Geert,
Those changes look good. Thanks.

-- 
~Randy

