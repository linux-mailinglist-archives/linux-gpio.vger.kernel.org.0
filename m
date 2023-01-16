Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD7FF66D347
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jan 2023 00:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbjAPXkI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 18:40:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233489AbjAPXkH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 18:40:07 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14555B760
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 15:40:06 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so8861566pjg.4
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 15:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ADluECR7OilPJxhfn2Q1cScJ9hHYVSTQRmzEcIN8BXo=;
        b=bbb2R5UzdzJtL5zbSNhI7gCA9QqnQIfW6B6uLVGKJDBa9I3n/o4mrmixS0oPXwoh5+
         RZLFVNZf8/saawlI2tlAczgGvQBak/LLq4oOfy5HGFAIqXep2X2Mdn84vnVZtNzfwssR
         rd0VBw6SILX0fyU7TGT6lJryL0PjHPeTwoi8t2bTOQlYosGnmFKLw9OUMzHcglvkfupf
         tGiwmmMHxbB1qqg4s8MGO5C7D7oqg+utW+/9lpvAXm73dHDqOZsu4neRH/Fcq4k1grj6
         FDeX5fpjjUnBfHZGcdkHSztiJ6SN1mQGzwaSIn2KmfywAVDqatP1cKcwaL2r6ing3I80
         JoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADluECR7OilPJxhfn2Q1cScJ9hHYVSTQRmzEcIN8BXo=;
        b=I1ocpZbj4VDbKBZlj6cPDgk5KKaom8Nkql3gHth35wr+WwpdOi2PmmzIpItuzrjHA9
         WD2aC8F8770ircRCqRoiLYeNbFyMj9Wb3eLHW8w+bSi2A8qWIHpISbrXAw1/F+1cOwa0
         FYcSbjeWaHonOyzJ490acJR99OR3plQ8W9DmVM2dDKfgkFrzAy78hjK9vNw/dVHdNLpj
         gKsx6tbyO1hQfeKZE9bA51oG3PSxVDnfKnGAUUXjTpkosELifMIKz4eeBVdRaIeQyn7c
         PRleUL6ubGpxpRdisgIIBev0d1DIB9hABJmS5GiN7CFBYE+mrFZGsAn05KKoYiculFVM
         N3wg==
X-Gm-Message-State: AFqh2kpQyTvcTX+sQJmoSRpqJM+xNqgPTi5H/6R9fgx/5YZDNOs5VFw8
        0Cl1P6lpd0Iqr6hXyhzUQKz+Xks1XsdMoQ==
X-Google-Smtp-Source: AMrXdXvTqHs7B0fhHfTVakSi/TT6OSwaSNh5i3eHq9BGhBZEjzy2v72ThaAoqRMT81G9pbb6JMPdrQ==
X-Received: by 2002:a05:6a20:7b01:b0:b6:8c0b:7146 with SMTP id s1-20020a056a207b0100b000b68c0b7146mr631737pzh.59.1673912405454;
        Mon, 16 Jan 2023 15:40:05 -0800 (PST)
Received: from sol (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id z6-20020a656646000000b00477a442d450sm16198851pgv.16.2023.01.16.15.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 15:40:05 -0800 (PST)
Date:   Tue, 17 Jan 2023 07:39:59 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 04/16] treewide: unify
 gpiod_line_config/request_get_offsets() functions
Message-ID: <Y8XgT4tJeUrZbcLC@sol>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-5-brgl@bgdev.pl>
 <Y8SW/frUy16O67Kb@sol>
 <CAMRc=MeHatoHX3O5zUuxQ12G4h4DCi7xAuiJuXe5kXveXOoRpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeHatoHX3O5zUuxQ12G4h4DCi7xAuiJuXe5kXveXOoRpw@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2023 at 10:37:14PM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 16, 2023 at 1:14 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Jan 13, 2023 at 10:51:58PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > We have two functions in the C API that allow users to retrieve a list
> > > of offsets from objects: gpiod_line_request_get_offsets() and
> > > gpiod_line_config_get_offsets(). Even though they serve pretty much the
> > > same purpose, they have different signatures and one of them also
> > > requires the user to free the memory allocated within the libgpiod
> > > library with a non-libgpiod free() function.
> > >
> >
> > They differ because they operate in different circumstances.
> > Requests are immutable, wrt lines/offsets, while configs are not.
> > More on this below.
> >
> > > Unify them: make them take the array in which to store offsets and the
> > > size of this array. Make them return the number of offsets actually
> > > stored in the array and make them impossible to fail. Change their names
> > > to be more descriptive and in the case of line_config: add a new function
> > > that allows users to get the number of configured offsets.
> > >
> >
> > Not sure symmetry => beauty in this case.
> >
> > > Update the entire tree to use the new interfaces.
> > >
> > > For rust bindings: also unify the line config interface to return a map
> > > of line settings like C++ bindings do instead of having a function to
> > > get settings by offset. A map returned from a single call is easier to
> > > iterate over with a for loop than using an integer and calling the
> > > previous line_settings() method.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > <snip>
> > > --- a/include/gpiod.h
> > > +++ b/include/gpiod.h
> > > @@ -780,19 +780,29 @@ struct gpiod_line_settings *
> > >  gpiod_line_config_get_line_settings(struct gpiod_line_config *config,
> > >                                   unsigned int offset);
> > >
> > > +/**
> > > + * @brief Get the number of configured line offsets.
> > > + * @param config Line config object.
> > > + * @return Number of offsets for which line settings have been added.
> > > + */
> > > +size_t
> > > +gpiod_line_config_get_num_configured_offsets(struct gpiod_line_config *config);
> > > +
> >               ^^^^^^         ^^^^^^^^^^
> > Not a fan of the stuttering.
> > What other kinds of lines are there in the config?
> 
> The user may not have an in-depth knowledge of the data model we use
> and just wants to use the library. I think this name is much more
> descriptive that way. It's not that long or repetetive, have you seen
> udev_monitor_filter_add_match_subsystem_devtype() or
> kmod_module_dependency_symbol_get_symbol()? :)
> 

If the data model is unclear to the user then you just made it less
clear as the implication from this naming is that there are OTHER types
of offsets/lines, but there is not.

I don't have a problem with your counter examples.  The first does not
stutter, and in the second the "symbol" appears to be the object, not an
adjective.  Length is not the issue - it is clarity. :|

But whatever - this is verging on bikeshedding.

Cheers,
Kent.
