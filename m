Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1DA226294
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 16:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbgGTOwY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 10:52:24 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40313 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgGTOwX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 10:52:23 -0400
Received: by mail-wm1-f65.google.com with SMTP id f139so25476128wmf.5;
        Mon, 20 Jul 2020 07:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2V8ErK/fpx1GjjJkd7zr33gxU0FS1gxM3mR4Aw7EoUo=;
        b=kXcauw4KWo52NLMGVnOA6rGdU7uF0CPKTxV/9N4B5J2kYLnVS74ASrrkqQ2q0/8/vC
         BBdVbZFfsbzKqLOYA9+u0v1q56P/4WZvSg6mHY8sqCctN0jDAPGfMT27U+8Pwrruufn2
         MG1BdGxygDhR8O5PvrmMGh5yaDtNrWys9S8OSxjgchwxswem3mJMhBM0WNg7Le0K317n
         SBsG4H4+/0dOBIiMQwStQxTtLRN8aQbgG11EpyWhE5hRoILxmIY4bXPej3KEBvDaIhu9
         mDhErdpXzNyAHvm4eazhQVMC5lrs3TSrcPqnhj9ey7kv97ivvT3FIqXxKiOYLwk/wy4H
         er1w==
X-Gm-Message-State: AOAM532JdA18aOwXpRG5w0+20jq5epioKu827I3eTonpvT4DXlszSSBP
        5ozWqV8HTGpOlve7vCwYsfs=
X-Google-Smtp-Source: ABdhPJwRT/a/cgcWM1P23aYPfb2HdGx66D1g8ZjbrhYnGQTfAXhRD4/WPbzkCbY4g9aop+qAOC4HsQ==
X-Received: by 2002:a1c:4343:: with SMTP id q64mr21957889wma.20.1595256741833;
        Mon, 20 Jul 2020 07:52:21 -0700 (PDT)
Received: from kozik-lap ([194.230.155.200])
        by smtp.googlemail.com with ESMTPSA id 33sm36808145wri.16.2020.07.20.07.52.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 07:52:21 -0700 (PDT)
Date:   Mon, 20 Jul 2020 16:52:19 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Thomas Abraham <thomas.ab@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 06/25] pinctrl: samsung: pinctrl-samsung: Demote obvious
 misuse of kerneldoc to standard comment blocks
Message-ID: <20200720145219.GA23990@kozik-lap>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-7-lee.jones@linaro.org>
 <20200720142714.GA6747@kozik-lap>
 <20200720144955.GD3368211@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200720144955.GD3368211@dell>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 20, 2020 at 03:49:55PM +0100, Lee Jones wrote:
> On Mon, 20 Jul 2020, Krzysztof Kozlowski wrote:
> 
> > On Mon, Jul 13, 2020 at 03:49:11PM +0100, Lee Jones wrote:
> > > No attempt has been made to document either of the demoted functions here.
> > > 
> > > Fixes the following W=1 kernel build warning(s):
> > > 
> > >  drivers/pinctrl/samsung/pinctrl-samsung.c:1149: warning: Function parameter or member 'dev' not described in 'samsung_pinctrl_suspend'
> > >  drivers/pinctrl/samsung/pinctrl-samsung.c:1199: warning: Function parameter or member 'dev' not described in 'samsung_pinctrl_resume'
> > > 
> > > Cc: Tomasz Figa <tomasz.figa@gmail.com>
> > > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > > Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > > Cc: Thomas Abraham <thomas.ab@samsung.com>
> > > Cc: linux-samsung-soc@vger.kernel.org
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--
> > 
> > Thanks, applied.
> 
> Same as the others.  Already in -next.

Thanks for letting me know. I dropped all of them.

Best regards,
Krzysztof

