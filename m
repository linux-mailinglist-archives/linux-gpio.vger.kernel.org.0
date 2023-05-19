Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10FB17099E1
	for <lists+linux-gpio@lfdr.de>; Fri, 19 May 2023 16:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbjESOdI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 May 2023 10:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbjESOdE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 May 2023 10:33:04 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D56E52
        for <linux-gpio@vger.kernel.org>; Fri, 19 May 2023 07:32:39 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f4c6c4b425so21334015e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 19 May 2023 07:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684506754; x=1687098754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYne49VIoqRhSpFAR/tplAe0+c73WPbKmEuwiQfyX1c=;
        b=AdMVUQ/Ju7D50A29mICSiia3GexFtdMaNAuD4fQsqTqLBnm83Zv6t/M9XNBktEuCLZ
         0/vRdFGMnG1RuO8wV0R2xiNXXqKk8iHqbJLz3NYpYVNiSs8gc/XedTTttuh2BrZCrBgB
         jgvfpENqH1zRJ7zODNOhmyE6onOuxHYEX+m/TVUXc0zxzka3KS1ZPfp8mKrfBU2kzeIv
         YmDiBBSTb6W7J3OPDDApObL9r46Vk4z23xTSGQFRO8dhRwPnEn6RdQvvLGzLENWCNhIt
         lVHYPqrJmLtktVQmC5c+0Bl/LSEu5uX04rEgtTxBp82ga6c52BQQ+dYNGXs3R0TSjiSl
         MqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684506754; x=1687098754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYne49VIoqRhSpFAR/tplAe0+c73WPbKmEuwiQfyX1c=;
        b=VCfk3CaMjc93omNJewiDFoZPCQYpnsEs46iYq6qgGEOKwpNR2UJx153wgS0rm9rncd
         aEl3cuufbNp+2GCFtHqolSh2VeGS9AJkSIiKNb6y6WSgCmGQjBdU+xsHigIl9IRZMa+/
         9/r0UMVD2tzrU8G6GQSBsq+n+N0DrNCqcVfeq/B9TZn6LC/IZnbw7KLY4Mz2L4ofC4go
         5i7+55FPsfi+nHCG58m6VKAY61NrBJ7PeSkCheTw1PExGanxfJgsLjBFyBb7Pauwzs+8
         o5how4F0nm37+CTpw7IPEDkWc7Xs+kUatlUtZkQPgBbMANkP7AlUj8nqBnTWHzfah/kg
         S64Q==
X-Gm-Message-State: AC+VfDy5wpzldoovBZthNUqtqyMPfv+Pb5cHo0k+VAaWQOq7VjQz+WW0
        FW2t5C1qsVtDWr0bsVTwBDA=
X-Google-Smtp-Source: ACHHUZ6uz04ocqPGFmlZrHY6MYMGNYDlwmDyiB2bGYNAl7kjIqeEJ59VBAB+qJbVAj4Utkorsl9mgQ==
X-Received: by 2002:a05:600c:2313:b0:3f4:2893:9bb5 with SMTP id 19-20020a05600c231300b003f428939bb5mr1438771wmo.12.1684506753943;
        Fri, 19 May 2023 07:32:33 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch. [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c028300b003f43f82001asm2562165wmk.31.2023.05.19.07.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 07:32:33 -0700 (PDT)
From:   Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod] Python bindings don't allow to wait on events indefinitely
Date:   Fri, 19 May 2023 16:32:32 +0200
Message-ID: <46830564.8zq9ZvEiHi@archbook>
In-Reply-To: <ZGcGZwwRiy2jFfR0@sol>
References: <3545766.4eto28bQOc@archbook> <ZGcGZwwRiy2jFfR0@sol>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Freitag, 19. Mai 2023 07:17:27 CEST Kent Gibson wrote:
> On Thu, May 11, 2023 at 10:28:34PM +0200, Nicolas Frattaroli wrote:
> > Hello,
> > 
> > in libgpiod 1.6.x, Line.event_wait's codepath had no path where ts
> > as passed to ppoll could ever be NULL. This means waiting indefinitely
> > was impossible.
> > 
> > I thought hey, maybe the new Python bindings in libgpiod 2.x fixed this,
> > but no, it has made it worse by explicitly setting timeout to 0 seconds
> > if it's None[1]. Obviously, this behaviour can't be changed now, because
> > people depend on this API to return immediately now with None as the
> > parameter, and changing it to wait indefinitely would no doubt break
> > actual programs.
> > 
> > So I'm left wondering if there's a particular reason users of these
> > bindings shouldn't wait on events indefinitely or if that same mistake
> > was just made twice in a row.
> > 
> > Is there some way the API could be enhanced to support waiting for
> > events indefinitely without having to slap a While True with
> > an arbitrarily high timeout around every single invocation?
> > 

Hello Kent,
 
> That does sound like a bug to me, but the rest of your mail isn't worth
> responding to.

I'm not quite sure what you mean. Was my tone this off? I apologise if
you took my displeasure with libgpiod's bindings as a personal attack,
it wasn't intended as such.

> A more productive approach could be to submit a patch that describes the
> problem and suggests a fix, say:
> 
>  def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
> -    if timeout is None:
> -        timeout = 0.0
> -
> 
> and see where that goes.

That would go nowhere, as this makes the API behave differently for current
users calling the function without an argument, as I've mentioned.

One solution would be to pass float("inf") and then check for that, this
wouldn't break the API, merely extend it, but I'm not sure how good of
an idea that is to do if someone uses an older libgpiod that doesn't
have an explicit check for inf. I don't even know what passing inf does
right now, but it's probably worth looking into.

> to submit a patch

Move the project back to a git forge and I will.

> Cheers,
> Kent.

Regards,
Nicolas Frattaroli


