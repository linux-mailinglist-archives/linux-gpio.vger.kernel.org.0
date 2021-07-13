Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0653C78F4
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 23:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhGMV3m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 17:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhGMV3l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 17:29:41 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C071C0613DD
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 14:26:50 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id ga14so29075875ejc.6
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 14:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essensium.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rB9ka8UmbSYMuMYVnBCdaHqWS9DILZjAnPwIQr9zVx8=;
        b=cWruB+0UE+kYxdRFbie3vrAlcKqY9PCtZUDSUop3p02WobCJIt7tvQp1rD6ASViUmp
         bi02LiJJZpdLq0/kG8P5H576jgzNCLBf8sBkd1FSaFlj1QNT5F+mxQE0UbYqyjKSd5MY
         Db0+pCqu2WV9gJwMKcTnn01yWqos42+J1PpxDC92Vbn5NT984PxjmaSJKDS0QUuLDx6c
         stDp2NZipViXXUfCbxhTqgvhst/wsYwOQIRo8ABqXe6va0PjkWhIlaoH19Ox7EGP7dhO
         OR1JNs6P/aAUArVoeCgpC7sfDm5w088rrxd/CQwgR1MxeWNr9ovH/kVnLncCQxdvcsCp
         zztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rB9ka8UmbSYMuMYVnBCdaHqWS9DILZjAnPwIQr9zVx8=;
        b=IWY52lact1YZLPl2OqXQvkNq8h10umjkp9r9DO5WVi7MU359T9k/WRsM5UJBBBQs6K
         suy9pE1g3trvphait2mb5IZIbRsyFeftYCWtBUgbY0Dhn+e9mmeexjfSeeFr5MUUjiWn
         AwSMH4r88GJG+H/mwXqA3Gl/QkjRaCIAkCC9HzzDX/LpmlRqvJfxXjbGhXFSnP8dCVMf
         s9cNR0bVwxkdTQKRQKDx6WeYkZewSjw7/TB7Kd45l+1SnGRzu1UH3JcGTqzReGVLkQ6I
         ryGFlsB/2sN1qyOtfw6y+VZbFjNxkuMNukQC45SBHo9T7zOlqLTjaYCnffLIKK9jIQES
         6HEw==
X-Gm-Message-State: AOAM530Nvz1fp7GxXiQcbpYUq/zM8CtYonDpCZFFrj8Z3wSqAG3vjc7U
        YL1ctTIhPeqL2RJnPGVUnQ1tMg==
X-Google-Smtp-Source: ABdhPJzoZkhRjq+KDF6vg964uxBOEdCGXzYV6r6EDqC2O4aRK3lc0FORK0LVvOSUxUKs5WFT0NxliA==
X-Received: by 2002:a17:906:3658:: with SMTP id r24mr8116339ejb.179.1626211608926;
        Tue, 13 Jul 2021 14:26:48 -0700 (PDT)
Received: from cephalopod (168.7-181-91.adsl-dyn.isp.belgacom.be. [91.181.7.168])
        by smtp.gmail.com with ESMTPSA id f22sm89692edr.16.2021.07.13.14.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 14:26:48 -0700 (PDT)
Date:   Tue, 13 Jul 2021 23:26:46 +0200
From:   Ben Hutchings <ben.hutchings@essensium.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] How stable is the v2 API?
Message-ID: <20210713212646.GA8031@cephalopod>
References: <20210712210836.GA3636@cephalopod>
 <CAHp75VdSVB4shmAO2Oww=UU_5pqR=W3JZ98ChjZwZaRZ9gbVdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdSVB4shmAO2Oww=UU_5pqR=W3JZ98ChjZwZaRZ9gbVdQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 13, 2021 at 12:16:52PM +0300, Andy Shevchenko wrote:
> On Tue, Jul 13, 2021 at 12:09 AM Ben Hutchings
> <ben.hutchings@essensium.com> wrote:
> >
> > I'm working on a project that requires GPIO debouncing and is planned
> > to use libgpiod.  But debouncing is only available on the unreleased
> > next/libgpiod-2.0 branch.
> >
> > What we'd like to know is whether the current C API on that branch is
> > expected to change much before release.  I don't expect any commitment
> > to API or ABI stability, but it would be helpful to have some
> > indication of how much change is likely to be needed in a client that
> > is written for the current API.
> 
> I believe this is the right thread to discuss and influence if needed.
> 
> https://lore.kernel.org/linux-gpio/20210621191830.10628-1-brgl@bgdev.pl/T/#ma70b1ab80804c09644f4a018ff5eff10464b195a

Thanks.  I've actually seen that already.  I don't think I need to
exert any "influence" as the current v2 API seems to do cover our
needs.

Ben.

