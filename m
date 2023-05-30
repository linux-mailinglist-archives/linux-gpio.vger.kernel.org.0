Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B94D716120
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 15:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbjE3NJO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 09:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232575AbjE3NJK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 09:09:10 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D0211B
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 06:09:06 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b025d26f4fso28974225ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 06:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685452146; x=1688044146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mDN7ZAqb88hoUSTsAscSaRF5CJIoiGgrge6ixHEDX4Q=;
        b=sbNJc1NUyRibf17mLCE1FplB8iffWbQim8+tWUHbKEaz/PSuGH7xbwe+to3ZkW/45d
         N5skAoMXs6VgrwYURbKElK5EyaJ+aKcQTbBNu9by2WoN7lYIsTp1a9gshxjQm1g9XGU0
         ustZ7ODh3/WYW9OMJYCDj1MfVULDMRrZ/+HajFm1KDVRVr/G9hql9J39g/BQZH+iA65W
         py8fDl+awcGzLFenk5sdYi+OTonB6kAgHdCYIn+BeOQZsmMctd+6pKSXyzUo+EkX1gu9
         T66JRsFRa5y03SaH6ZI7YDbhaF0rf+EO5mdttny44EaO74MCLczM8xVRdtg+R/Amybir
         6bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452146; x=1688044146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDN7ZAqb88hoUSTsAscSaRF5CJIoiGgrge6ixHEDX4Q=;
        b=CTp3Z0dvEQYc6veiZw7/RSUXlbQc/NPbPj5itCgRaUyQZI+/oDlJvlgln+AI2D1bbw
         MCxzD2vW21aj61ZmQ3/0z3IfLn5aa9HqOpOahM21l6SxImy9+R/QLp99GNznvRGf5ORS
         jI8hhKRznCMxQsBM+Jbt/w8cSx38G1Q4MoST3iUcMZoB3MMh5R1qkEIqdxztWYXtkl69
         570ClqN1g1s4QhdChYvjqtahP0H1eeVz2fcws/u8iQqpnhI1e6DTUJgb4H1N6Jn4EIlD
         BJtc5LjnTHE7zuNWWEej2tWfmjWXHCnS1JdFvrrlK+GRN4LmUHRgivPyK2Mzscgo91nH
         tjLg==
X-Gm-Message-State: AC+VfDy0WWEQGwNagPjagJMjf3aw9DCB6OrsDDXfs0yqDrLD8IEJ6iM/
        n1Q5quiW4DUdpTzuFtnHCLwzCe1UVBM=
X-Google-Smtp-Source: ACHHUZ7EzjMCHApZ0HM5/dTZMCUMOAGMM3s8aj9c+Y4w32ObpnvlbzQZP9LQsJ1psXwqfA9vNvV9jw==
X-Received: by 2002:a17:902:7616:b0:1ad:c736:2090 with SMTP id k22-20020a170902761600b001adc7362090mr1979435pll.3.1685452145793;
        Tue, 30 May 2023 06:09:05 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id w6-20020a170902e88600b001b050db1894sm2303343plg.36.2023.05.30.06.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 06:09:05 -0700 (PDT)
Date:   Tue, 30 May 2023 21:09:00 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     andy.shevchenko@gmail.com
Cc:     Gabriel Matni <gabriel.matni@exfo.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH] tools: gpiomon: add timeout option
Message-ID: <ZHX1bEThvg8Cq8zD@sol>
References: <PH8PR11MB71425AE7A35F6E651A5B3425864A9@PH8PR11MB7142.namprd11.prod.outlook.com>
 <ZHXB83x85Qchv1XJ@sol>
 <ZHXcLvUNvw75Z-3W@surfacebook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHXcLvUNvw75Z-3W@surfacebook>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 02:21:18PM +0300, andy.shevchenko@gmail.com wrote:
> Tue, May 30, 2023 at 05:29:23PM +0800, Kent Gibson kirjoitti:
> > On Mon, May 29, 2023 at 08:20:44PM +0000, Gabriel Matni wrote:
> > > From: Gabriel Matni <gabriel.matni@exfo.com>
> 
> ...
> 
> > My preferred solution is to run gpiomon as a coproc and have the
> > controlling script perform the timeout. e.g.
> > 
> > #!/bin/env bash
> 
> Oh, this is too bad.
> 
> > coproc gpiomon "$@"
> > while :
> > do
> >         read -t5 -u ${COPROC[0]} event || break
> >         echo $event
> > done
> > kill $COPROC_PID
> 
> I'm wondering what coproc is and why it requires bash.
> 

And I'm wondering why your mail got to the list, but not to me directly,
despite being directly addressed.  It isn't even in my junk folder.
And it was gmail to gmail.  Now that is weird.

Anyway, coproc is a feature of many shells, such as bash, zsh, ksh.
I don't think or ash or dash have coproc, but then you cn always use named
pipes to similar effect.  It would be similar to the simple gpioset
daemon I posted the other day, just in reverse.

I did say that coproc was my preferred solution, not that it is the only
one. 

> What I want to have and keep that working is that all our tools can be run in
> Busybox environment (embedded application). That's why I'm against seeing bash
> in any form of the tooling.
> 

It isn't IN the tooling.  It is in the shell that calls the tooling.
The tool test suite does require bash, but that is due to the framework we
use, not coproc.

I take it you would be in favour of an idle timeout option then?

I'm puzzled why no one has ever asked for it before, if it is something
that is in demand.

Cheers,
Kent.
