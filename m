Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB509C8D5
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2019 07:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729194AbfHZFzx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Aug 2019 01:55:53 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35065 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfHZFzw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Aug 2019 01:55:52 -0400
Received: by mail-pf1-f193.google.com with SMTP id d85so11082039pfd.2;
        Sun, 25 Aug 2019 22:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hqn7EcXGG+na8lq/oAT4dVNK820cThIhQDAa/rVI8KM=;
        b=js6iXP191VnVvAPboIH1SjuzNrSBHInwhyq0SUwaHfSSk9ih3ZB254bMCIq6hbU0vu
         uts/87y57ZakARGUUnx0ziBpNYV/bIE2iitnsnaRT/nxBPba+LJpH4JB7aP7LfK+fYp+
         nK2oDrxCqwYwh2Q3XlI7NiFlCmwlybzFm+tcUGD2uRe8ni5e7LVUiNwugwoVJpblCnve
         V6PZzoAYfHKJ9aMVMe85omGYTARRJNbBR6hCzat2cHviWZ5v4bbRrHrM9EyTSnVBsRoY
         I78q4zCnyIZLgvOt0w47svgjgNykRfCl8soRcLV7oAXh2xcKodlOXJREp1qDzM6+S29E
         cs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hqn7EcXGG+na8lq/oAT4dVNK820cThIhQDAa/rVI8KM=;
        b=V1UTlkrbYRlqRnlmZ07OJrj4/SXVbPtBogV7bLUmxH8G/6HNiXrV2HB1cRvXYKXJ6M
         vk7vKU4omfVmZYMh2WvU7UOSlZ7H94vsDAAjSboGX3GD3D+1csLlv4NiiUAxCXFVL27R
         PLWZJ5uTH2/T8LByRDQ9t1Uo+bC4wDRRUc0yqfXdm/i9prpTcH0R03FlHojZ6fV4QPmx
         ALKP1kGrutaY8XQirw2OACSr6q5B5f3OdxVenYLEj0oFT5xh+sD7f6stqACJ3Do5qeMv
         tQqc7zejrUy6iT5OKS+IEUt2NjurjertoZzPGhbrnxCisnFBO3+RJEGBX6j3yTxPoRvF
         SRaA==
X-Gm-Message-State: APjAAAXFhf4rBj4oAXtF27MxGtmEJqmHM7LLXmPjgmQXLU+15LDOmpBY
        hHkcSMZjwcsoFBFUsQjwenzbvEH+
X-Google-Smtp-Source: APXvYqzc0qL5b0dNbHgos8Lu/LDjTJreyCc9Y4PksAI5LrgtnVP2Mklhde89CDMFZAQreiks48Xh3Q==
X-Received: by 2002:a63:2784:: with SMTP id n126mr14423506pgn.92.1566798952201;
        Sun, 25 Aug 2019 22:55:52 -0700 (PDT)
Received: from localhost ([110.70.50.154])
        by smtp.gmail.com with ESMTPSA id p8sm20117664pfq.129.2019.08.25.22.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2019 22:55:51 -0700 (PDT)
Date:   Mon, 26 Aug 2019 14:55:48 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v1 1/2] vsprintf: introduce %dE for error constants
Message-ID: <20190826055548.GB26785@jagdpanzerIV>
References: <20190824233724.1775-1-uwe@kleine-koenig.org>
 <20190824165829.7d330367992c62dab87f6652@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190824165829.7d330367992c62dab87f6652@linux-foundation.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On (08/24/19 16:58), Andrew Morton wrote:
> On Sun, 25 Aug 2019 01:37:23 +0200 Uwe Kleine-König <uwe@kleine-koenig.org> wrote:
> 
> > 	pr_info("probing failed (%dE)\n", ret);
> > 
> > expands to
> > 
> > 	probing failed (EIO)
> > 
> > if ret holds -EIO (or EIO). This introduces an array of error codes. If
> > the error code is missing, %dE falls back to %d and so prints the plain
> > number.
> 
> Huh.  I'm surprised we don't already have this.  Seems that this will
> be applicable in a lot of places?  Although we shouldn't go blindly
> converting everything in sight - that would risk breaking userspace
> which parses kernel strings.
> 
> Is it really necessary to handle the positive errnos?  Does much kernel
> code actually do that (apart from kernel code which is buggy)?

Good point.
POSIX functions on error usually return -1 (negative value) and set errno
(positive value). Positive errno value can be passed to strerror() or
strerror_r() that decode that value and return a human readable
representation. E.g. strerr(9) returns "Bad file descriptor".

We don't have errno. Instead, and I may be wrong on this, kernel functions
are expected to return negative error codes. A very quick grep shows that
there are, however, patterns like "return positive errno".
E.g. drivers/xen/xenbus/xenbus_xs.c: get_error()

		return EINVAL;

But this EINVAL eventually becomes negative

	err = get_error(ret);
	return ERR_PTR(-err);
	
or net/bluetooth/lib.c: bt_to_errno(). But, once again, bt_to_errno()
return value eventually becomes negative:

	err = -bt_to_errno(hdev->req_result);

So errstr() probably can handle only negative values. And, may be,
I'd rename errstr() to strerror(); just because there is a well known
function, which "translates" errnos.

Unlike strerror(), errstr() just returns a macro name. Example:
	"Request failed: EJUKEBOX"

EJUKEBOX does not tell me anything. A quick way to find out what does
EJUKEBOX stand for is to grep include/linux/errno.h

#define EJUKEBOX  528  /* Request initiated, but will not complete before timeout */

One still has to grep; either for 528 or for EJUKEBOX. I think that it
might be simpler, however, to grep for EJUKEBOX, because one can grep
the source code immediately, while in case of 528 one has to map 528
to the corresponding macro first and then grep the source code for EJUKEBOX.
Overall %dE looks interesting.

	-ss
