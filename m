Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB1ED708F43
	for <lists+linux-gpio@lfdr.de>; Fri, 19 May 2023 07:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbjESFRe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 May 2023 01:17:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjESFRd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 May 2023 01:17:33 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736A5E4C
        for <linux-gpio@vger.kernel.org>; Thu, 18 May 2023 22:17:32 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-64d2b42a8f9so699123b3a.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 May 2023 22:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684473452; x=1687065452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GopQx/2MVI31GgAif5rdj1bBkoYmtiPhSKueL8o1BI8=;
        b=GeKbZ7xGugoCH+ZfB3V7m9b5M/1PF+H6HpPSTJO9d5qTNm992k3SYoct1EiGOKGZeE
         vs6B1aG8xCU4JtL8URMG7WsFzDGUAFm+mH0lEHFKNM920D/arTGS1f3vBZ4uLH5ScszG
         mE3d7FrEIg68LALnDfSlZzUdIgyICHyudDHJwpdB9qKynR6rMKI3Nn/kWHPCXlfOyoT6
         wbR4df6s594Pxu6JoPktvTGqRMU/eYe9ZsqfShHD7I9sRXoZyvtqzmHY0DcBfoewZWvx
         ig5NZL4WiBp2ZoUivrnnYvy0dPqajEZR1B0j3w7ANohTGdXQe3Yr2R9frqt0sd26smk5
         kYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684473452; x=1687065452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GopQx/2MVI31GgAif5rdj1bBkoYmtiPhSKueL8o1BI8=;
        b=DYXg5bNBy/8ikwetx5ncYYWcYUcCC+DsDp1wot3PSwpaB8p/UHtyQa2Da4BURcLtbf
         keVbMPGevAGn09QaPbVHJ0148cadTw2x4lUWgf4xnphjs5+VfJICtzLz6vgsMPD5ghQh
         t8OEqH9MwuDRm2JfouBUo60itOuHOlfK5jeRnjWyoloNCa1ZOvBc7wUbsOqL2Hkhgvry
         oX5nU0pKGAf0E/dUIuPGjqQyz/HoeUzrmMD5oSJfnYRYh1NdJKFKwFNUNs1mz+DMA6vR
         aOAxaPOIj6coor7CzzZwzxjj9EBZq6Dz6hMcgI+qMQUdK7midqCMxk/2RolDrbiSjs3Z
         WbhA==
X-Gm-Message-State: AC+VfDzCxiv9vTr7IhKUZ5xfFe1L3zbOvfUj5ARJ2hd3Mfuqab24g8Ba
        VC0wDyRQ6y+VrkJMCByxKiQ=
X-Google-Smtp-Source: ACHHUZ6yhRbln7Ffgr3FktK2wdLujWjktMcwUqumOEj2bAH0IyTQ4HeoMEdKN+LGGyBjmLTMaedMgA==
X-Received: by 2002:a05:6a00:1783:b0:644:d77:a2c5 with SMTP id s3-20020a056a00178300b006440d77a2c5mr1738253pfg.29.1684473451792;
        Thu, 18 May 2023 22:17:31 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id j13-20020aa78dcd000000b0064afdc88465sm2151638pfr.213.2023.05.18.22.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 22:17:31 -0700 (PDT)
Date:   Fri, 19 May 2023 13:17:27 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod] Python bindings don't allow to wait on events
 indefinitely
Message-ID: <ZGcGZwwRiy2jFfR0@sol>
References: <3545766.4eto28bQOc@archbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3545766.4eto28bQOc@archbook>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 11, 2023 at 10:28:34PM +0200, Nicolas Frattaroli wrote:
> Hello,
> 
> in libgpiod 1.6.x, Line.event_wait's codepath had no path where ts
> as passed to ppoll could ever be NULL. This means waiting indefinitely
> was impossible.
> 
> I thought hey, maybe the new Python bindings in libgpiod 2.x fixed this,
> but no, it has made it worse by explicitly setting timeout to 0 seconds
> if it's None[1]. Obviously, this behaviour can't be changed now, because
> people depend on this API to return immediately now with None as the
> parameter, and changing it to wait indefinitely would no doubt break
> actual programs.
> 
> So I'm left wondering if there's a particular reason users of these
> bindings shouldn't wait on events indefinitely or if that same mistake
> was just made twice in a row.
> 
> Is there some way the API could be enhanced to support waiting for
> events indefinitely without having to slap a While True with
> an arbitrarily high timeout around every single invocation?
> 

That does sound like a bug to me, but the rest of your mail isn't worth
responding to.

A more productive approach could be to submit a patch that describes the
problem and suggests a fix, say:

 def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
-    if timeout is None:
-        timeout = 0.0
-

and see where that goes.

Cheers,
Kent.
