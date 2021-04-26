Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46BD36AFFF
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Apr 2021 10:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbhDZIwN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Apr 2021 04:52:13 -0400
Received: from smtpcmd01-sp1.aruba.it ([62.149.158.218]:60050 "EHLO
        smtpcmd01-sp1.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbhDZIwL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Apr 2021 04:52:11 -0400
X-Greylist: delayed 422 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Apr 2021 04:52:11 EDT
Received: from [192.168.1.128] ([79.0.204.227])
        by Aruba Outgoing Smtp  with ESMTPSA
        id awqrlwcRLkdBBawqulpyHF; Mon, 26 Apr 2021 10:44:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1619426667; bh=0lin7PRsaVUh9+pc8RNX6uCUFrWzouDNtCUoLZfmI70=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=dhg4Js3DemfxCCkyZ6zYWGSGN4g2eLfPtEIF4tWNSgWw81k4ND8+jjVvN0SxCzNZD
         qL4FwbxB6XBlUUFXfiWyzqyEhDqqNajO7Qkgf9ZsvQ4gz/DrJZVjmisD3m6ZgCndu/
         R06vDY3XOBEoyLvPzEvq7PFWYjUevO0lK+PJEhnVm1akc9h7Qq7eYXVX5LPjaA89ag
         ztGplN2vlLzePPlY20w0CKD4wEhn7BVHKEQMSS5vT1r0nCsTHMtYZZi21+i1J1ydWW
         MNNhJ0M8EYXQt3fR0cdigqi2DlaZps2trlMISrf2tkRvaAlbbq4P5cCdOHIqLYqE1h
         ezk4fgmXNhKdA==
Subject: Re: [RFC v2 GPIO lines [was: GPIO User I/O]
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com>
 <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com>
 <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
 <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com>
 <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
 <CACRpkdYFAW2bcB53M3_b2LsveJO_PWZJhprGhdTtfmW11B1WmQ@mail.gmail.com>
 <f66dc9c4-b164-c934-72a8-d4aca063fca5@enneenne.com>
 <CACRpkdbjc6vvpHVjnJNGisRw6LiLZd-95aHWJJORwvaRNigPcw@mail.gmail.com>
 <cb6e208b-446e-eba4-b324-d88aec94a69b@enneenne.com>
 <CACRpkdZBUw5UPyZB-aeVwh8-GiCifbwABZ9mOsyK90t3cdMQ+w@mail.gmail.com>
 <80bf1236-aacd-1044-b0e5-5b5718b7e9f0@enneenne.com>
 <CAHp75Vc1ezuW9m8OCQUmEJoNVoD-Z3eWF=Lzcr2v32Br8Gr60w@mail.gmail.com>
 <CACRpkdY+amtrDE4gaSU5Du2CUivxo6gnUV5zZOcaJJ8=md-4Kg@mail.gmail.com>
From:   Rodolfo Giometti <giometti@enneenne.com>
Message-ID: <87207962-5848-3e5c-4d8d-f4a66c864413@enneenne.com>
Date:   Mon, 26 Apr 2021 10:44:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdY+amtrDE4gaSU5Du2CUivxo6gnUV5zZOcaJJ8=md-4Kg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKQhStgCTDV54jL+H/lv8XTBhVN2mr/bovATWRl0fdTX5xSIqVkPP/AFvJODB9PVF6Dc/smS2RPd+PdoNk5ltEeHPygbdc38X3QQcsFREgpx0QX+59LH
 eS0HJWphhe7vZ0DAzzKn3VedcYtzdqx/4Bzgjx3gA4jOYb+C7P/eqeuon8TRyRQfXpYjHa1RitIv/7N94UN8Ky36D+IKYy+zTVIMe+ZUc40iNiMEL5130rX/
 47YmIzVXJXfsygobk74m4fi2NP16dSrB8JXlta1LzkxI9pL1lQgFlTZFH4EYZ0DHViucuFrP8g2pLqMmOX+ml+k1+EI1AD0eeC76S0UbzKCFOde5DK+qlRp+
 tmKaf2JM8OzMvK/V5eLObQrNRuwI4jwOHkFFIJ1aTS/SvatvBNsxgGHg8tXf7DbGA/yvNca7xLiOnSkglDQGDvFgwh6eIQ==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20/07/20 10:17, Linus Walleij wrote:
> IIUC Rodolfo's idea is to provide this with a DT compatible.
> The use case will be industrial automation-ish tasks from userspace.
> 
> Currently the only mechanism we have in the device tree to
> assign a use for a line is the "gpio-line-names" property,
> which creates a name that is reported upward to the character
> device.
> 
> Rodolfo's patch is for scripting use cases, assigning some lines
> for some cases to be handled by scripts, not the character device.
> 
> What I am a bit worried about is if this would be a Linuxism, as DT
> should be OS neutral.

Hello Linus,

I'm currently using my solution for GPIOs management as input or output lines
described in the DT on several systems.

Are you re-thinking about this topic? Can we go further for inclusion or should
I continue doing out-of-tree? :(

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
