Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3672475E6
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 21:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729523AbgHQTa0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Aug 2020 15:30:26 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:33962 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390230AbgHQT37 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2020 15:29:59 -0400
Received: by mail-il1-f194.google.com with SMTP id t4so15561006iln.1;
        Mon, 17 Aug 2020 12:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FpFm0NgNiDqAexVigqjuzKZAAaZLotZJRuJ9L95Do60=;
        b=Mq8aUrmmKaxT4+Dp9BmArVFRl3sTisvL4Lglivp4UB9VEtQhG6lzna62bH5eGfLR/N
         3T0m5bt0J+6ftk7mdpjx8zXAFsr3vqv9V1iYXjTCasRg4tZvh9dGQAd3kqNZ90D2Ab06
         e+0JFuM5SGVtOoFvuD7JBnFLdeTKEzN8J80qJP2Vh17PYRwzc5uVvPxwnXadXokbqj+k
         tDrfqQqip+1p9CWjjBRIDbssjJ8ZKTl5eIaWA3H/cxOPxohyaNZOyzFn4amYOTj76iFO
         lc2O8ka01Y4fqjNIGkg0FdJwN9BOyQuJgqQU9HKBRkY/Xd6m9BwR5KUgMqH2tA5Bp9LE
         DK3w==
X-Gm-Message-State: AOAM5321Ll5DnKvajP50b9rVInjhTnVuMVPdUW1NlMMtzdVlkaCR2p6q
        Okp0Q7JX7qfbBA0oSWqyS5gvqbtNcg==
X-Google-Smtp-Source: ABdhPJygpJYJZbSJFFFLfwam8k8Pk1UNtIiJG/OEfigzlhmKdRcuLTTYGPFlws8J9FXaf6XfuPRdCQ==
X-Received: by 2002:a92:d4cf:: with SMTP id o15mr15611895ilm.25.1597692598797;
        Mon, 17 Aug 2020 12:29:58 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id n9sm9556901iox.43.2020.08.17.12.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 12:29:58 -0700 (PDT)
Received: (nullmailer pid 1405345 invoked by uid 1000);
        Mon, 17 Aug 2020 19:29:57 -0000
Date:   Mon, 17 Aug 2020 13:29:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thomas Preston <thomas.preston@codethink.co.uk>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] pinctrl: mcp23s08: Fixups for mcp23x17
Message-ID: <20200817192957.GA1401599@bogus>
References: <20200814100357.209340-1-thomas.preston@codethink.co.uk>
 <26d33248-c07b-db2c-2989-3ca14aea7896@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26d33248-c07b-db2c-2989-3ca14aea7896@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 14, 2020 at 02:56:54PM +0100, Thomas Preston wrote:
> On 14/08/2020 11:03, Thomas Preston wrote:
> > I'm in the process of adding a device tree overlay for the PiFace
> > Digital Raspberry Pi daughter board [0]. It's an mcp23s17 SPI GPIO port
> > expander. In doing so, I noticed some errors with the mcp23s08 driver.
> [snip]
> > They're quite trivial and backwards compatible, although I might be
> > wrong about "interrupt-controller". Can someone please confirm?
> [snip]
> > [0] https://github.com/raspberrypi/linux/pull/3794
> 
> Actually I think I'm wrong about the interrupt-controller changes in patches
> 0002 and 0003.

You are. Looking at the datasheet, the GPIOs have interrupt capability. 
GPIO controllers are typically both an interrupt client and provider.

Rob
