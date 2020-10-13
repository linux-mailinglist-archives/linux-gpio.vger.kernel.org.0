Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5523528CF26
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Oct 2020 15:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbgJMNaB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Oct 2020 09:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728672AbgJMN36 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2020 09:29:58 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ACEEC0613D0;
        Tue, 13 Oct 2020 06:29:58 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id n9so17547347pgf.9;
        Tue, 13 Oct 2020 06:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qrYg7bfRvDRrJWtXMjEBqN1fn9mamPKlkfP6WyyftBQ=;
        b=jOlToQlG+pSaAIdLOoKylVkUnf6TVUDWUgaa8e+EEnM/LaxjaWO/EtZA7a+/Gl/BKk
         VUZScdix3vNe8eH7ijMPDn9eICdr34GEe0VoRuZmDa8G+pv6a86NLg389X96HZwT4+SU
         3RksHFG/a5z/71hswDq3m2k78smmMotqo4CUr86umOYgOQjpPwF9pk5Rlx5z3VWMozT4
         2b1cOXVu+yX3ppkqvPnbjTLGSeupV9W8/piM+LfuoZLnDArBNZ+at6uVcK87Y4l6EoOp
         T7nDUof8zRY21PwHUcUSRN3gD69m10goWaHUatOOGBl5kt7IkQqh6CRCbE5wNnwomMit
         SgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qrYg7bfRvDRrJWtXMjEBqN1fn9mamPKlkfP6WyyftBQ=;
        b=g1hbAZ53cDt4OMBUva+uYvCgGOBxZkZMlbGvwjdbMCSdKOB+4QBMwk80SSW3Hu4nxh
         F9M1SyIx0uPIBVKEyW2RMJJplnADTdXRtF1UtqF/H/IJWTg7ZkP/22zhmScoQlkuS6qC
         yuQdaz9g7xXFhmGXivsM/ZhdJfSYWeOpQ1ri/dRJZWViZa87YJtRaBnxA0oj7BKVor5G
         c79z9ui9oEO3Qu26jBL7Lh4+sQIwxCH2o5djKc3Pw2u1saTzO77I6eX3+KkV9+LHb/nR
         HPsceUerEFWJsPPjSrD9DjN8ghdciK4ego0CwsP84BvgONhZPqgKMRgtPklvkQ6420UU
         dRpA==
X-Gm-Message-State: AOAM532CtwpFeop4oDYMY+50nPR6XfCb2aEVT8z2PF1SrrCwpgvXLziV
        mpPjfegLtEVyIecs5zrEMP4=
X-Google-Smtp-Source: ABdhPJxIPxCfM81ARBJOyb3H5fsPQw12QxtJ2CM+ZpVk1H2cb2/Bsn6vp7avqGIJu90G1dsKL2sEYQ==
X-Received: by 2002:a63:d905:: with SMTP id r5mr15880141pgg.300.1602595797632;
        Tue, 13 Oct 2020 06:29:57 -0700 (PDT)
Received: from sol (106-69-182-59.dyn.iinet.net.au. [106.69.182.59])
        by smtp.gmail.com with ESMTPSA id u69sm24979025pfc.27.2020.10.13.06.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 06:29:56 -0700 (PDT)
Date:   Tue, 13 Oct 2020 21:29:52 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 0/5] gpio: uapi: documentation improvements
Message-ID: <20201013132952.GA219958@sol>
References: <20201005070329.21055-1-warthog618@gmail.com>
 <CAMpxmJUbxuAHmcf_1vP27qb1gSXTfE1OBb8X3MSoESpa=pycgQ@mail.gmail.com>
 <CACRpkdZ+9-bFg1zYXE=ppGUa0OY0f9-+QRefd1q1OMsLEdh1dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZ+9-bFg1zYXE=ppGUa0OY0f9-+QRefd1q1OMsLEdh1dg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 13, 2020 at 03:21:47PM +0200, Linus Walleij wrote:
> On Thu, Oct 8, 2020 at 5:46 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > On Mon, Oct 5, 2020 at 9:03 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > I'm intending to add some GPIO chardev documentation to
> > > Documentation/admin-guide/gpio/chardev.rst (or perhaps
> > > Documentation/userspace-api/??), but that is taking longer than I'd like,
> > > so in the meantime here is a collection of minor documentation tidy-ups
> > > and improvements to the kernel-doc that I've made along the way.
> > > Hopefully nothing controversial - mainly formatting improvements,
> > > and a couple of minor wording changes.
> 
> > For the entire series:
> >
> > Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Linus: can you take them for v5.10 through your tree directly?
> 
> I am waiting for Kent to respin them addressing Andy's comments
> on patch 5/5 then they can go in as fixes I think.
> 

I had replied to Andy's comments - I'm prefer with my version than his
suggestion:

"I'm not keen on that alternative as what it suggests is actually a
pointer comparison, and even if the user realizes that they may instead
use "strlen(label) == 0", when they shouldn't be assuming that a null
terminator is present in the array.  I avoided mentioning "string" and
kept it in terms of the char array for the same reason."

Cheers,
Kent.

