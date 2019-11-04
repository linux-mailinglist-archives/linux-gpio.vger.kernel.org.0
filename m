Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3007EE90E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 20:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbfKDT6n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 14:58:43 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36571 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbfKDT6m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 14:58:42 -0500
Received: by mail-pg1-f196.google.com with SMTP id k13so799669pgh.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 11:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=14/7fGNS6Tdxw1xU02cIYZCJQ9hrk1aeGdD9i1PuoNk=;
        b=VrgZFnTN/onbUxFLLnhzkPwlo7Z0wFw2jFvZz0jQKLDStLO/76/m6dVkbiWnMskgfJ
         DAOZ3kaFhzlMw4MBTgwNSO+//YjAVUmIj7ZEUsaYG3/g9Q9Ewnf3CcNxmLZOZNA8UbIW
         zzfaiHe/Ra/u7j4rXQec2rZ1s+eZGfyaycYGgRT7RkmoGMTCxjDlfOrCx7cotWehvOy5
         ZKS7IbdQ6MPiP5uT783gvrl0ObW939mSsZFCJhqSsopqya1jYifkRJG3eZ0q29Xo49iG
         60IgynqYGpeQLHpd+ICcJJEZwocDGE0OOOZ38pDVW6IDX+gxiQfXMx+vGMLr517i1lYR
         /HPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=14/7fGNS6Tdxw1xU02cIYZCJQ9hrk1aeGdD9i1PuoNk=;
        b=PTf9AMfLmJJjWF4WIyGnuzxCFDzeVxvFGFmHT2Q9HNWRyBNbcF/rbvCKW55AmYnIE7
         C7ywcHbOetZnyAdErDxJQxLos0mbiv8ZBa/XoUycswtkaM35x9+/aVOBTNFssY0Cpfh8
         /0Go12PBK466FI5m7M9X39ljune4kp5/JGYN1jSY0f7VEDw1Ggz8FvzRmozzU8pDiGYN
         EuKaac33DHHBxkv7DD+8jftRc0r2YaOHr9X2nHiCg8l0twZ6DuE52OpA3hlKuMs6OeGv
         lJya1rQKjblxwjCRdSdzd01T2blePQD0UI5gwaPrMZlCcv1D1mlawAB6YaeYbHWyN/wz
         O/9w==
X-Gm-Message-State: APjAAAXLEW3xNlS90faflAsBJDEniaJWOwS5EKRBU0glMVGdXNygJIpD
        OrC538akmBWyuWFvSriJIqs=
X-Google-Smtp-Source: APXvYqwVo96PqPOLzahpD0jUmhWAmqaMp3Cdg70zNe1+15hA7hWHVEs8OOgzcZdf2K4y0Q2MAuKMHg==
X-Received: by 2002:a62:1dc6:: with SMTP id d189mr14814829pfd.100.1572897520539;
        Mon, 04 Nov 2019 11:58:40 -0800 (PST)
Received: from x1 ([216.243.17.14])
        by smtp.gmail.com with ESMTPSA id y14sm20409280pff.69.2019.11.04.11.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 11:58:39 -0800 (PST)
Date:   Mon, 4 Nov 2019 11:58:38 -0800
From:   Drew Fustini <drew@pdp7.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 0/7] gpio: expose line bias flags to userspace
Message-ID: <20191104195838.GA9833@x1>
References: <20191104153841.16911-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104153841.16911-1-warthog618@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 04, 2019 at 11:38:34PM +0800, Kent Gibson wrote:
> on a Raspberry Pi, in both cases using the feature/pud_set_config 
> branch of my Go gpiod library[2], as well as with my feature/pud 
> development branch of libgpiod[3].  Patch 7 has only been tested using 
> my gpiod library as libgpiod has not yet been updated to support the 
> SET_CONFIG ioctl.
> 
> Patch 1 adds pull-up/pull-down support to line handle requests.
> Patch 2 adds pull-up/pull-down support to line event requests.
> Patch 3 adds support for disabling bias.
> Patch 4 adds support for setting bias on output lines.
> Patch 5 adds pull-up/down support to the gpio-mockup for uAPI testing.
> Patch 6 refactors the flag validation from linehandle_create.
> Patch 7 adds the SET_CONFIG ioctl.

Hi Kent, thanks for continuing pushing this patch series forward.

I've not used gpiomockup before and I was hoping you might be able to share
the commands you use to run it to test the patches.

thanks,
drew
