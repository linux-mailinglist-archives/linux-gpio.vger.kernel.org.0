Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C646F12AD69
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2019 17:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfLZQQC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Dec 2019 11:16:02 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38988 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfLZQQC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Dec 2019 11:16:02 -0500
Received: by mail-pf1-f193.google.com with SMTP id q10so13374529pfs.6;
        Thu, 26 Dec 2019 08:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jkvhyKVe9beEFOrVuTAJtQsNNZWB09LHeEspW9aoOto=;
        b=OOwZeBmE81M04vqBjpbAQPzE1Jv7jX88b+pZMM4skQSdW5QALfcM5UmXOZhj7/FTkj
         4DhhNJVBgdY2v5jYTZSvR7SjywMtapzuo94KlQhX+i6gd5qEU70YJjXcGW5wlrv6/DLH
         04erO3Xts4xY+OTACxMlHd9zwhYsvTs+7+b5tSqtSzRRF+2vJLzlc5ShWkr6yXDN/Z5P
         Cs6NqkIQzW5fpc3w9talZH/jXomQOF8gLQG2TxuLxk/W4pIU+2n6OV4BfIDq9Ls7bXG5
         N7LmxXMt8wpbp7C6l1/KyrBUR5jHtMqnYnA9OSENlKkWdwirmF4pu/lCe4EH/9TXAcbZ
         hRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=jkvhyKVe9beEFOrVuTAJtQsNNZWB09LHeEspW9aoOto=;
        b=MR8G+z+lpp4nYq24VPrcW5ZklKa6dQ5o1Qq91M6KQcLSkPK/bY2Ves2yrSa30I7GZy
         EwsfwHLwCNWOMa0I7JCzav6QW4cK7L7zEcOklGdGvI+1r/tLGzjzVbsvmBA2KNdfgaBN
         TzM81/ckVK0wtHSdafveV8kS2v84fQ7/BGJNYCEpOHRncMRnNWdCcOJPZo6orVAFsVPb
         d2cvi7rSYR4UzJDa7i2HV4Q34E7cuYsioSCzTcvyh+/MoI3NmO/DKw493MhDIMHtbu9m
         4IzmduKvSuGLrxNMBIO7cO/goJRx+wTCsL6SabeBBSJuMX/FoGBwU5eMTFEvqarqMulG
         m/ng==
X-Gm-Message-State: APjAAAWeena9yTT7Xw3IaNHXmZs4aAFKNESl9HY9ckIWDIfsNrTIXBC/
        RTlLCBg5DWedhGtd8hDcbko=
X-Google-Smtp-Source: APXvYqwVVFAvQB+Vc97OxwqUsIcXopUjlkiipdOIflXffhnqN51FDYFXBGdYuGbNEFp+n+2UzJ7cpw==
X-Received: by 2002:a63:5809:: with SMTP id m9mr47977371pgb.26.1577376961023;
        Thu, 26 Dec 2019 08:16:01 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j38sm34451197pgj.27.2019.12.26.08.15.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2019 08:16:00 -0800 (PST)
Date:   Thu, 26 Dec 2019 08:15:59 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Yury Norov <yury.norov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Yury Norov <ynorov@marvell.com>
Subject: Re: [PATCH v2 07/11] bitmap: Introduce bitmap_replace() helper
Message-ID: <20191226161559.GA26197@roeck-us.net>
References: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
 <20191022172922.61232-8-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022172922.61232-8-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, Oct 22, 2019 at 08:29:18PM +0300, Andy Shevchenko wrote:
> In some drivers we want to have a single operation over bitmap which is
> an equivalent to:
> 
> 	*dst = (*old & ~(*mask)) | (*new & *mask)
> 
> Introduce bitmap_replace() helper for this.
> 
> Cc: Yury Norov <ynorov@marvell.com>
> Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This patch results in the following boot log messages on various architectures.
I have seen it on arm and mipsel, but others may be affected as well.

test_bitmap: [lib/test_bitmap.c:282] bitmaps contents differ: expected "0-1,4-5,8,12-13,16,20-21,24,28,32-33,36-37,40-41,44-45,48-49,52-53,56-57,60-61", got "0-2,4-5,8,12-13,16,20-21,24,28,32-33,36-37,40-41,44-45,48-49,52-53,55-57,60-61"
test_bitmap: [lib/test_bitmap.c:286] bitmaps contents differ: expected "0,4,8-9,12,16-17,20,24-25,28-29,32-34,36-38,40-42,44-46,48-50,52-54,56-58,60-62", got "0,4,6,8-10,12,14,16-18,20,22,24-26,28-30,32-54,56-63"
test_bitmap: [lib/test_bitmap.c:290] bitmaps contents differ: expected "0-1,4-5,8,12-13,16,20-21,24,28,32-33,36-37,40-41,44-45,48-49,52-53,56-57,60-61", got "0-2,4-5,8,12-13,16,20-21,24,28,32-33,36-37,40-41,44-45,48-49,52-53,55-57,60-61"
test_bitmap: [lib/test_bitmap.c:294] bitmaps contents differ: expected "0,4,8-9,12,16-17,20,24-25,28-29,32-34,36-38,40-42,44-46,48-50,52-54,56-58,60-62", got "0,4,6,8-10,12,14,16-18,20,22,24-26,28-30,32-54,56-63"

Guenter
