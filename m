Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBDA1662CF2
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 18:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235012AbjAIRhN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 12:37:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237177AbjAIRhJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 12:37:09 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF002DCF
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 09:37:08 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id l184so9473308vsc.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 09:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pCf5ONqpEhYo2jWK6XMONclsCJvgDnzkEyxN24nZ99M=;
        b=G7McUF+BtwYoV58yXoWy4txi9ddlFpS6JN6Tq9HbMI0GzmTlB5f9kHAkhJii71UxiP
         Z4RRGwEocY8e5xLmuQ68jOB83+BEmM2i4BPoWjEBQy49958kygQR8ACcIFCpoMDy4i1J
         B6QjiijqvmaDxfU8ocohecFlkjrGsnuFSPUrKbJ6cA25UpHJeZeH5H5lwYpnetYpZhHB
         m7RT6IMMCqjtkpA0lxoJfoMTlXEb8z8KNpQ2Wf7+l6ssaxdEIzro9r80B68MemJ7Nm1t
         mvoGItwI3eNFY5mzRs4MXKN8a0cruiCG7T1JUJMCfxIb6WPX3feZ6/RQRiMVip/ZTla+
         jIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCf5ONqpEhYo2jWK6XMONclsCJvgDnzkEyxN24nZ99M=;
        b=LMhRsIMnhGWMh0O8z9H7OFuyMNN1Rh47QSZvFQ9aBoQ/jzsQDBSynZElC49wKdetpo
         /fuyOpw0so0deeB3qebb07wKWwbk0Dy2PYQHrCitXozaNxG0B8gC7kc2rHAqvdTIEBYZ
         mT82NsRx6QxAVzCXXkcLx4fSaCOIkab+Wzbgco3nBygwS1wc7+k+CDASJ/dwrjVoJi+e
         txNLBmg7r2SAP7Wf7348nyRBkVpP933BrRg4I5a9poClWANN4ZASf7OJtvhhVRfdUoe+
         vDDDb6lfZiyjZEkWq/d85U6DpJk9+fGSX0amTByfrLsvY9e/FL4Bo/7Qp8LCBxYM7ulF
         Vjjw==
X-Gm-Message-State: AFqh2krHkWTqN8yXmCOXcXIVS+D2gj7nX8WmHxV7SXtB98vypAXDaKMC
        bF5Xm8/AZLVoElmbcWdzUKezCfZcd/Nn2xB0hzjPmxN5LN2qog==
X-Google-Smtp-Source: AMrXdXu/d+wgGVJ4RftK/AV476RHLKcbB8bnPqaZVd6pVTQnfMgeNVETTSNEoZ+LgSSry3V7Cq0PvcFxXWPmqw84xD0=
X-Received: by 2002:a67:df09:0:b0:3ce:88b3:d7da with SMTP id
 s9-20020a67df09000000b003ce88b3d7damr4693661vsk.62.1673285827331; Mon, 09 Jan
 2023 09:37:07 -0800 (PST)
MIME-Version: 1.0
References: <20230106115129.393007-1-brgl@bgdev.pl> <Y7v6oWaNVgltjC8V@smile.fi.intel.com>
 <Y7v61HBtu1cPOS2D@smile.fi.intel.com>
In-Reply-To: <Y7v61HBtu1cPOS2D@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 9 Jan 2023 18:36:56 +0100
Message-ID: <CAMRc=McbtdZAm7JJF1AEus+vYdUFoNFrtj+WMH_4QS3_52GcZw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] core: make the library NULL-aware
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 9, 2023 at 12:30 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Jan 09, 2023 at 01:29:37PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 06, 2023 at 12:51:29PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> ...
>
> > >  GPIOD_API void gpiod_line_config_free(struct gpiod_line_config *config)
> > >  {
> > > +   if (!config)
> > > +           return;
> > > +
> > >     free_refs(config);
> > >     free(config);
> > >  }
> >
> > At least this is redundant. free() is NULL-aware itself.
>
> And if free_refs() is not, it's better to make it explicit or fix that function
> if possible.

free_refs() is not public and it's used elsewhere too where the config
pointer is already checked. I prefer it this way.

Bartosz
