Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E27FD1007D2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 16:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfKRPB6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 10:01:58 -0500
Received: from mail-pf1-f176.google.com ([209.85.210.176]:42066 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbfKRPB5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 10:01:57 -0500
Received: by mail-pf1-f176.google.com with SMTP id s5so10505694pfh.9
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 07:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=899hTqfMhSqPYDVf7ZLg2pUQKRnnw8vxMDqtO5hYrC8=;
        b=vC8YOHohdUiPqH0MBHxs1Mf4vrjclZuw1X+YGkVNylvtBpy59nxIhQqoKhJDGr0i16
         eiXSp+jsuvDz3C2Tt2ieKz0MGnGzxS/eBrPEk9mp0+yhpZlORAdj1AVdQ64XKx5h3kNH
         0PLY2mF8BPO4B+RRDCqDPEjpHlka1R+oBGSbGBxZbkgZy1Co+VMCb9eXQmc/fmy/QlUU
         iDjzf/i6dO3J4j0NVhiGaZB4TiMpAlu5comt+CR6OotRpBnfg2Q/fY9S7deqgeg0JtG/
         kMMEnDS/ofPqZO5shWQRSxwcm/IswylGquzKCkHnA5biRXxrEiKEl3nCYAzxnSOTFjfV
         RLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=899hTqfMhSqPYDVf7ZLg2pUQKRnnw8vxMDqtO5hYrC8=;
        b=jN8Yv8E4Zf/Ng9wN8bXpawJsTIytljDGeGKdiFMqdebmbnlQ5TDE4eFa4VTCpEVrzV
         MbQIbPbYU8e7B45+2dWKuKgi6gGZmfsYAgaX7gMPjq0LP4cCxMZ0Gjh0WEJ8ug3Q2Xe0
         id70KFWwK4uCybbd+2vHLA+O2Ybs0ZcIpXIiXQXjxxCkcClyVJm8hyglABQ3XO1skSP+
         BJMHHLuaY8mEB4uqo+a+BCGLKSRuFF2SwkqNsmmT3JCXeyA2NXtDy3Xh9OFyapQOyOf5
         l41GscQ38gQBQHCvDofqf0f+H2DlUKPO9WcCXpp/uFITXhyEoh2ZQLrFsXMsFif5bmcO
         T1Gg==
X-Gm-Message-State: APjAAAWCZ8ScRwb5tExB9Xga+CaFunMl5ZHmcUUMa50TULqRtB2a/0bw
        UpJZdjMt63gxdgXaKlWOajk=
X-Google-Smtp-Source: APXvYqwWbyH55KLoCQF+DccY/4KaTzbdYqFYpnYJl+2skf1fcdubNTzCbwYVjCf3Tfytq9xhUqM5Cg==
X-Received: by 2002:a63:745:: with SMTP id 66mr32840021pgh.389.1574089316852;
        Mon, 18 Nov 2019 07:01:56 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id x13sm21883366pfc.46.2019.11.18.07.01.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 07:01:56 -0800 (PST)
Date:   Mon, 18 Nov 2019 23:01:50 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 19/19] treewide: change "correspond with" to
 "correspond to"
Message-ID: <20191118150150.GF27359@sol>
References: <20191115144355.975-1-warthog618@gmail.com>
 <20191115144355.975-20-warthog618@gmail.com>
 <CAMpxmJVuw84__hhd=HVmZVMhZzeb4VuYNhC==A94QRE-vG3ZUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJVuw84__hhd=HVmZVMhZzeb4VuYNhC==A94QRE-vG3ZUg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 02:52:56PM +0100, Bartosz Golaszewski wrote:
> pt., 15 lis 2019 o 15:45 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Trivial grammar fix. "correspond with" can mean either being in agreement
> > with, happening at the same time, or communication between parties.
> > "correspond to" is used to mean equivalance, which is the intended use
> > throughout the documentation.
> >
> 
> Thanks for this. I'm not a native English speaker, so if you see any
> other language issues, please let me know, or feel free to fix them.
> 

In general usage you most often see "correspond with" in the
communication sense. Using it in the other senses is rare.
Ironically I wasn't totally sure on the usage without looking it up, but
it felt wrong as it was.  There are one or two cases in the documentation
where the "in agreement with" interpretation might work, but even there
the "correspond to" felt more appropriate to me.

Cheers,
Kent.


