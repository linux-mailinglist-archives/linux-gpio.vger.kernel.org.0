Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9831028AE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 16:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbfKSPw4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 10:52:56 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42197 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbfKSPw4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 10:52:56 -0500
Received: by mail-pf1-f193.google.com with SMTP id s5so12364340pfh.9
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2019 07:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CHlJBOtlHEnuqyCM5ypY1BKJ1K53MQMZG9TM2kuObJQ=;
        b=IhKX9sd4Q7yr0RlIf4rspCV3qVDwWQ7l2ENvZ+21k2y50gbGr2U3c7/P2XIrV421ly
         7fhhBRrV2kS5PVzRzJrxeSurpxUuepnG/AmoM9wRj4tEuPg+wDrYbfMgbOX9WKrTIGhC
         I7va/zhkFKUAj57VXDxMYGCXGWIoMesiMuBn8R18qQyeg+/cyXqUvj/lByuaASAlZRXC
         3fz9N5bFiktXbJ0yc3FIxcY4ss978zwW4D9THi55pQybIktY0Mj84+LF2un88qoGlMlh
         Prs7+mi+6UQ/W2oQoS1YdM3fvQEksEnQEbFHRxjqYxceG9qW0v9a65Qkg7tnkM8X9BnC
         eucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CHlJBOtlHEnuqyCM5ypY1BKJ1K53MQMZG9TM2kuObJQ=;
        b=F5ObsjKjZrFhS6hS+2jq+WEuwivGCeBVxQ7DS4+dmyU1tu2jb6DUDIH5Qr8VPQEwIV
         niBcqJGaYJOHjunstPwMOw9SfVf/avagSBSXie894RvnbKunh/8wjwXfDWV3PexHXxgn
         7Ffj3Obtl/RCflSc6PlmZp1JiKYEtliWcYHeLByoPakNEepzCgTSMXGjLw4Fezt6+mBV
         zd+U15RODaUihva/ZcknOHuGadRU6/FxHCSCd65w3+ICvdw8THp6BmIZqgpw/NJ91maL
         HGqJ0AW/+gZz6fJE267derqc6/X0paafTOxFgtyTD8mvBHTUTIpcajdKR0p4h4Sswem4
         /hvA==
X-Gm-Message-State: APjAAAU9QoXWO3szmDkA+s+YecLG+pYXorLLpJl1uLB00X4eoN4flMAU
        0iug8xIdwCgpFblD4G20O6M=
X-Google-Smtp-Source: APXvYqyd8xtoe4qIDIgyhNhJWvLVu9+Wldph/CGkVpMq0/VcDEcPSVkNMz4oE19otDbv2OU1O6UFRg==
X-Received: by 2002:a63:f94e:: with SMTP id q14mr6327297pgk.411.1574178775149;
        Tue, 19 Nov 2019 07:52:55 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id u65sm25832562pfb.35.2019.11.19.07.52.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 07:52:54 -0800 (PST)
Date:   Tue, 19 Nov 2019 23:52:49 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 11/19] API: add support for SET_CONFIG
Message-ID: <20191119155249.GA20834@sol>
References: <20191115144355.975-1-warthog618@gmail.com>
 <20191115144355.975-12-warthog618@gmail.com>
 <CAMpxmJXcEFO-05H-O0Kjs8Latwhh9RWos0tXzkc_C7KyEye8Yw@mail.gmail.com>
 <20191118144825.GE27359@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118144825.GE27359@sol>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 10:48:25PM +0800, Kent Gibson wrote:
> On Mon, Nov 18, 2019 at 02:52:04PM +0100, Bartosz Golaszewski
> > > +
> > > +int gpiod_line_set_flags_bulk(struct gpiod_line_bulk *bulk, int flags)
> > > +{
> > > +       struct gpiod_line *line;
> > > +       int values[GPIOD_LINE_BULK_MAX_LINES];
> > > +       unsigned int i;
> > > +       int direction;
> > > +
> > > +       line = gpiod_line_bulk_get_line(bulk, 0);
> > > +       if (line->as_is) {
> > 
> > Can you explain the purpose of this as_is field? I'm not sure this is
> > really needed.
> > 
> 
> It is there for gpiod_set_flags, which has to populate the direction
> flags in the SET_CONFIG ioctl. The existing line->direction is
> either input or output.  It is drawn from GPIOLINE_FLAG_IS_OUT, so
> as-is is gets mapped to input.
> I didn't want to change the existing line->direction, and adding the
> as-is seemed clearer than adding another flavour of direction that
> contained all three.
> 

Hmmm, I think I see what you were getting at - the line->direction is the 
direction from the kernel, so it doesn't hurt to use that value to set the
corresponding request flags - even if the original request was as-is??

If that is the case then the line->as_is can be dropped throughout.

Kent.

