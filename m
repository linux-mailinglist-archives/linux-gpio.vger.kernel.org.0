Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4CDE67310C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 06:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjASFP3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 00:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjASFP2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 00:15:28 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A05CA
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 21:15:27 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id c6so1292928pls.4
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 21:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8kResjRZVDN9TQJ8BsImLXDi+cQRMry66EOYb7DRAQk=;
        b=LeW4SLw5WtrKie5iDRngCxONSK4frM+Yu5lzm784NcBXdw+wwT60v0LT9Oesg57fUg
         tSxR6LcvIwiBCO+W+1waNI1ccClZHvj8wpaQHlLeVuHlEOoXsqOq4Y9YOb4r5vrvBkEe
         DwYyok2F1GXA6tg86djDD0jC2C4/yGAwAPruYS3KHRupQQJ3Qv2HWEqCASO3CWuUvaXp
         RUXtufmSPpUZccZL8DUzCtsyv/cSEoJ7ZnXBjyIIIfHsaOvnAf9h0RtZcIOIMARRNCJr
         IuZxloHAOl1chUljY206loR48GuSJ9Jk/XZUwXd2ArXSM36Tgv4an1EQRLm0mFpfQpRr
         eNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kResjRZVDN9TQJ8BsImLXDi+cQRMry66EOYb7DRAQk=;
        b=XhlkgaRhDYRJJyu/+/U/O7DJoxHM+ZQGMW0Hb44ytxwBn6fbpeEEFifgXaCsSVrKQu
         weEIn7IPaA5E6sSuc6Ut9ABvFmvUBR7/S7iQwUw+XGVUBsX3VURx+VxnaDK/U3QsOShy
         l/Mh0Oh/d36hHcU11FftBzbgA/3MK/7gTzkxIl3TpQgOW/pYvrt0z5SxbKF0OD7FOv65
         5D9bfgtzg5qk5NwjuSLKtVg/hTm0EtthNzctyyQY3eoye7vjkelAO5pxt3k3U+2qHxHw
         PcrvyjhAwUf3Aaqc1J6ziFZ/PJ9wfLFMSbuIvI14kmRWeDXHrvj4uxKTigufyPKfrygj
         e6uQ==
X-Gm-Message-State: AFqh2kqtez1VLJJxlPsREoTZihhPvT+frve9z+rspHXHqMbwmw40MPXZ
        aDy6vx5aE/Zl9I4WrqoPmpu+mw==
X-Google-Smtp-Source: AMrXdXtr09ooL/rB+h02sON0t835A2GYDBZ6l+b4GiHRIrbtHcJgQus2eryLPe61dA5IWAp9CXaJpQ==
X-Received: by 2002:a17:903:2481:b0:194:b105:5cb4 with SMTP id p1-20020a170903248100b00194b1055cb4mr6995653plw.25.1674105326759;
        Wed, 18 Jan 2023 21:15:26 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902a38300b001896522a23bsm24028129pla.39.2023.01.18.21.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 21:15:25 -0800 (PST)
Date:   Thu, 19 Jan 2023 10:45:23 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 04/16] treewide: unify
 gpiod_line_config/request_get_offsets() functions
Message-ID: <20230119051523.5nrad6pwpbgxzmmp@vireshk-i7>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-5-brgl@bgdev.pl>
 <20230116055209.b6ydvderreqtqedp@vireshk-i7>
 <CAMRc=Mfm9ENHh5T4MguXh9YaPYdvSwsOWXyvHYhQGS47xOZcTQ@mail.gmail.com>
 <20230117054440.rtgmbupz7wap4qh4@vireshk-i7>
 <CAMRc=MfiUfNwUOgYT6LmDDVDj_kiB1FfWXe+Z+CtenwgKb3vvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfiUfNwUOgYT6LmDDVDj_kiB1FfWXe+Z+CtenwgKb3vvQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18-01-23, 21:51, Bartosz Golaszewski wrote:
> On Tue, Jan 17, 2023 at 6:44 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 16-01-23, 22:39, Bartosz Golaszewski wrote:
> > > On Mon, Jan 16, 2023 at 6:52 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > > +        let mut offsets = vec![0; num_lines as usize];
> > > > > +
> > > > > +        // SAFETY: gpiod_line_config is guaranteed to be valid here.
> > > > > +        unsafe { gpiod::gpiod_line_config_get_configured_offsets(self.config,
> > > > > +                                                                 offsets.as_mut_ptr(),
> > > > > +                                                                 num_lines) };
> > > >
> > > > Can the returned value be < num_lines here ?
> > > >
> > >
> > > Ah, of course it can. Need to add a test case for that. How do I set
> > > the size of offsets to whatever this function returns?
> >
> > Instead of any heavy operation, you can rather do something like this:
> >
> > let num = unsafe { gpiod::gpiod_line_config_get_configured_offsets(self.config,
> >                                         offsets.as_mut_ptr(), num_lines) };
> > for offset in offsets[0..num] {
> >         ...
> > }
> >
> 
> It sees 'offset' becomes an instance of std::ops::Range. Is there
> anything more to add here?

This builds fine.

diff --git a/bindings/rust/libgpiod/src/line_config.rs b/bindings/rust/libgpiod/src/line_config.rs
index b276cf0c4931..e30ef7c35328 100644
--- a/bindings/rust/libgpiod/src/line_config.rs
+++ b/bindings/rust/libgpiod/src/line_config.rs
@@ -106,14 +106,14 @@ impl Config {
         let mut offsets = vec![0; num_lines as usize];
 
         // SAFETY: gpiod_line_config is guaranteed to be valid here.
-        unsafe { gpiod::gpiod_line_config_get_configured_offsets(self.config,
+        let len = unsafe { gpiod::gpiod_line_config_get_configured_offsets(self.config,
                                                                  offsets.as_mut_ptr(),
                                                                  num_lines) };
 
-        for offset in offsets {
+        for offset in &offsets[0..len as usize] {
             // SAFETY: `gpiod_line_config` is guaranteed to be valid here.
             let settings = unsafe { gpiod::gpiod_line_config_get_line_settings(self.config,
-                                                                               offset) };
+                                                                               *offset) };
             if settings.is_null() {
                 return Err(Error::OperationFailed(
                     OperationType::LineConfigGetSettings,
@@ -121,7 +121,7 @@ impl Config {
                 ));
             }
 
-            map.insert(offset, Settings::new_with_settings(settings));
+            map.insert(*offset, Settings::new_with_settings(settings));
         }
 
         Ok(map)

-- 
viresh
