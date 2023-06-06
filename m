Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB560724283
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jun 2023 14:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236000AbjFFMml (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Jun 2023 08:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236548AbjFFMmi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2023 08:42:38 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 593BC10CE
        for <linux-gpio@vger.kernel.org>; Tue,  6 Jun 2023 05:42:12 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-652d76be8c2so5337464b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jun 2023 05:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686055332; x=1688647332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MZV0E7R5FU29cIXSk0zEoN7A092W0ZibYxk4uM2ILyk=;
        b=jQBlHiAeI93rSbIW5MNmNFHCxKlkYZgGYEgvIL++PIS5dgeV/KVr74DFZ4rXAoYDz2
         be6hec3S5JBXlYbCJmCoM7Tvmd7FAmQJ5Yq/7vZJuJERL27xDLHoZtomonAN1TTsYD/z
         GjJJR9yJADp+lHk3Y5D8ZFvcU44BdBKg4u7phNT/sVjG2M+v8lv1Vdi+kh+fCmyF24gQ
         8nBhs4saLo7bxgG4ydaKHxBMIXmhQKiaAf36OjfpVo3pI24WUJVanWzeUQmSnpAs1fEp
         scVWoJ29vYDaBGOjcHcxncrdCGZp0kpQMRoL164L/Fr+an0jIVRcDkM5yUDRnqvFDwUO
         sCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686055332; x=1688647332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZV0E7R5FU29cIXSk0zEoN7A092W0ZibYxk4uM2ILyk=;
        b=j3/m5ZnxDOxSRVfBIAjchhdB5Kn+0b6SnLaNHwYxs5KiIxZejJ4jnAtPoqu0t5Mh1w
         WIDnTvaIKc+wTE392Z0ALBb6lJbKBaB5tMe44O/XtTu/hNr50yTTiSTECQrBLd1K1Coj
         ongch8YBVLqHwdbpbuOeJJaztP09/dkZNXd1M/TU4VLPYztdC+m/8BFCyDrDdikJgahN
         a9deyFxzW4XC/sh/Tf3ngwdrFCFQfNXtPfbbJxZ6FMjDYJmpWOcV71/VhE7vnnXxIwIT
         oCHqrHaeJhS1CGRYj73qqvqp/Sx2rcotO/oyudOECGW8UQtzIMDYjdmH5QKfKA37v1w8
         kqAg==
X-Gm-Message-State: AC+VfDw0Gf1egTjlAfkgD09BDpmdGJ1M043JmzBnONY1svuVTD9yCYRy
        IMAsaGjLBthDBM0HuiHETSGTmpW/9rc=
X-Google-Smtp-Source: ACHHUZ430PNDECzEalamPa5PFf9lmCKvkG5+RjsZff0LNlFWagKomvTW5amYoVnVcJFcNsDYsbIYKg==
X-Received: by 2002:aa7:88c3:0:b0:64d:5f1d:3d77 with SMTP id k3-20020aa788c3000000b0064d5f1d3d77mr2111164pff.34.1686055331750;
        Tue, 06 Jun 2023 05:42:11 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id p20-20020a62ab14000000b0064d1d8fd24asm5179947pff.60.2023.06.06.05.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 05:42:11 -0700 (PDT)
Date:   Tue, 6 Jun 2023 20:42:07 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     joe.slater@windriver.com, linux-gpio@vger.kernel.org,
        randy.macleod@windriver.com
Subject: Re: [v3][libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Message-ID: <ZH8pnxccmgSPnb+9@sol>
References: <20230605204335.4060789-1-joe.slater@windriver.com>
 <ZH6rRD5B2hNyXcuV@sol>
 <CAMRc=MfAjiJhc5qpuHu_=Zb7NhAnw4GFNXEFN8Gh9ZfV8NOWLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfAjiJhc5qpuHu_=Zb7NhAnw4GFNXEFN8Gh9ZfV8NOWLw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 06, 2023 at 02:32:37PM +0200, Bartosz Golaszewski wrote:
> On Tue, Jun 6, 2023 at 5:43 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, Jun 05, 2023 at 01:43:35PM -0700, joe.slater@windriver.com wrote:
> > > From: Joe Slater <joe.slater@windriver.com>
> > >
> 
> Patch looks fine but interestingly, I'm not seeing any improvement in
> terms of execution times. Is this to be expected?
> 

This patch, as it stands, doesn't address execution times, it addresses
the possibility of some delay throwing the test script and gpiomon out of
sync and making the test fail.  So making the test more robust.

The toggle rate of the test is slow to reduce the likelyhood of sync
loss.  With this change it should be possible to increase the toggle
rate and so reduce the test duration, without impacting test reliabilty,
but that has not been done (yet).  And even then it would only reduce
the run time by a second or so.

Cheers,
Kent.

