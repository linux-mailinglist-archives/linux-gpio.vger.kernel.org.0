Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9252530EDAC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 08:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232941AbhBDHrn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Feb 2021 02:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234483AbhBDHrm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Feb 2021 02:47:42 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3691DC0613ED
        for <linux-gpio@vger.kernel.org>; Wed,  3 Feb 2021 23:47:02 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id c132so1542781pga.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Feb 2021 23:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=41k6/Br2dEAheslDj6eGm8t3m1CekeaO74gqIfyKr4g=;
        b=pt/96seHNS8L+ZfNOR2uSQGE6w8Iwl6JN0uGCGfThVAm+Vf5mx2eY9Jqtabjq/tKHa
         bCZCV7lMQJadrFZ7TUrHuBBfAnO4yVWX57wcntVmA7LiI12Kc+WssQ0BG+qLsVe0nYd4
         LEG7dXuJ6xUjbnnXd9D75vVbYYhHqgp83sQ8eu9Lx7xWacouf2FaFo5IJVKq0ALHVIWj
         ihsAbbV54PZhT+fYHPI8Gk05cNJmpJfNzn6qZFajNhrF+vA5fVWrJ/D3TCGTx8RWHl3Y
         hRWTqApjoqUJywQjIdI2I7iaoJCOUR15i4bmIdki1IW29Mv5xZOjaY56TduB/aoF667+
         KBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=41k6/Br2dEAheslDj6eGm8t3m1CekeaO74gqIfyKr4g=;
        b=lBN1H5AA+XpxHAcPGwXbmWlQ4SHxpgkvJzxYrtc0LutVgJ+dk7179b0Q/NBkc4Qz1w
         Ndj5jGtudcTpvYDDaGML59qoiYgblgmukkpHcUy8RUIpvk1eyfWOtlvC9NghRPTWLwxk
         2svKL+AoauVXIt7iDzWGv1zCDhtYJgVAneyoMU776Raesm0rNrH8GPJToNUnFyK7ZXVr
         M84W7vpt4xhyeJfrjnlAdhNNASNcLHvpPOSyqn71YlkvmlEgyUVYtlxyDqBPP3lX0wfD
         blXa9WSXkYRJCFjAKZvFe/BuGAobfMuBUg/0hKy0GYbh2RqiZ2oFxYYom1CyQFMFT4qT
         J19A==
X-Gm-Message-State: AOAM531qvxojDGLQocicJqVMNHHr9Q3mda8T+GAFjv0muA8xxeCVL1mJ
        ZwNF2syZdMvu+0lrBcJ2n0qjsg==
X-Google-Smtp-Source: ABdhPJwOPqkO5dZ7dKG8OXWMJxBLQnabg7BBjYr7iIDslub4fSbdAcIlrod2x2BXblIBzpvT1gkuPQ==
X-Received: by 2002:aa7:9f5a:0:b029:1d4:fa02:a044 with SMTP id h26-20020aa79f5a0000b02901d4fa02a044mr1794422pfr.30.1612424821654;
        Wed, 03 Feb 2021 23:47:01 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:7b0:75e8:7735:4209])
        by smtp.gmail.com with ESMTPSA id m5sm5233340pgj.11.2021.02.03.23.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 23:47:00 -0800 (PST)
Date:   Wed, 3 Feb 2021 23:46:58 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     bcousson@baylibre.com, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: am335x-pocketbeagle: unique gpio-line-names
Message-ID: <20210204074658.GA271881@x1>
References: <20210127000303.436595-1-drew@beagleboard.org>
 <YBubDME90umkF9aQ@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBubDME90umkF9aQ@atomide.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 04, 2021 at 08:58:20AM +0200, Tony Lindgren wrote:
> * Drew Fustini <drew@beagleboard.org> [210127 02:04]:
> > Based on linux-gpio discussion [1], it is best practice to make the
> > gpio-line-names unique. Generic names like "[ethernet]" are replaced
> > with the name of the unique signal on the AM3358 SoC ball corresponding
> > to the gpio line. "[NC]" is also renamed to the standard "NC" name to
> > represent "not connected".
> > 
> > [1] https://lore.kernel.org/linux-gpio/20201216195357.GA2583366@x1/
> 
> So are these needed for v5.12 as fixes, or can these wait until after
> the merge window for v5.13?
> 
> Regards,
> 
> Tony

I suppose it depends on if/when the patches to make gpio lines unique
go in.  I believe the last response from Linus W. was in mid-December
and indicated he holding off merging as it was immature [1]

Thanks,
Drew

[1] https://lore.kernel.org/linux-gpio/CACRpkdbXRHCDGX-YBbNY7cMob0dZNhi1ETA3QnC71ZtOYB30JQ@mail.gmail.com/
