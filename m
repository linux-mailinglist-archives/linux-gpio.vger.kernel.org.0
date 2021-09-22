Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A87EC414848
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 13:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235852AbhIVMAq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 08:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235848AbhIVMAq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 08:00:46 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C50C061574
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 04:59:15 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id v10so4373308edj.10
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 04:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essensium.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=CvF+rxOKgOsYGCNK9i3IsFlkOsZqk9CJx2pGyK1Mnp4=;
        b=Ur7X6XnnpMgDUOjN22A+BNKMghDR1ZpA4nFIzEYSVbUWsRVbmnl+sT/Hnrfebfb85d
         iQ6GrnW5xo3edypXuOhjadWElnZkK/7HvC8CebP2mUX2ROsyoD7oDp3q9pRjARQZwz8b
         EuMSWwkBLgk+f1Z7Bam4BtcXauHUFLa6+GlQDGzFhSzw2cXNBuOdBxvHpQFWfOBf54D1
         qsBmlfdAuWC2KhTyjjA1XT4VATZhg4aEXqPEO1DvuQL1oqmujk6q9h6zQ6DvFJQfZKZc
         2wpbxFrTQpJ5cr46dXRE/UNTZrU3uOsWjkNo4JAievXkD1ZxQogtGVUjV4vgBmC+JFhV
         Ys/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=CvF+rxOKgOsYGCNK9i3IsFlkOsZqk9CJx2pGyK1Mnp4=;
        b=Ein8exfydqUVQcZz9HMWvv/2Qvkmd7pXzWPZNOWR6ptBvHdU/P4mZyTTSE9I3IokNF
         nM6RKs3w/iiT40PibwWgODrPL2zEyG98xcm4iq58AHfoHS+GXqEoxZT1DH8BR8/Aiw55
         oiMik6tZkyGLdabMFa28L42ixdt6EKzrC0KfoAStFM+XVK0OOZ+p35qDbOh8p+P7lrzf
         gf9j7fTaDYIQjmfPYU1bstrytJRIaESzDeav+iRU9qC4+fvwq+nvllsly0fXQmrZVHjn
         0N+K2ciwyO67KxqcRzITKb9l57vfnFW/z3GAtUajVM0OZO/TrlWuvvx/3Tc5NsB0InXg
         6Qbg==
X-Gm-Message-State: AOAM532ydVopeYn6N8JCIkVDDxkIrElD0wVCbg4JU7o5Ua/bf6xL9GaC
        H+0vyWTiNtwBJHpHSjz2W6tnDwr2bkwKtjqU
X-Google-Smtp-Source: ABdhPJwnc2ENPieWC8spD1HGtC+/UkGNWoF9AS8GnBl6jH4PWGUFtlkCdVrTmd4QzHr/In/S0hZP3w==
X-Received: by 2002:a17:906:7208:: with SMTP id m8mr40754010ejk.82.1632311954286;
        Wed, 22 Sep 2021 04:59:14 -0700 (PDT)
Received: from cephalopod ([84.198.211.186])
        by smtp.gmail.com with ESMTPSA id cr9sm1095675edb.17.2021.09.22.04.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 04:59:14 -0700 (PDT)
Date:   Wed, 22 Sep 2021 13:59:12 +0200
From:   Ben Hutchings <ben.hutchings@essensium.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH libgpiod-v2] tools: Restore support for opening chips by
 label
Message-ID: <20210922115912.GB24226@cephalopod>
References: <20210728211916.GB14442@cephalopod>
 <CAMRc=McdCUmqny7d11pdf6ShSEbMRf+V0od-SrKmmE7NrjG2Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McdCUmqny7d11pdf6ShSEbMRf+V0od-SrKmmE7NrjG2Qg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 20, 2021 at 04:32:22PM +0200, Bartosz Golaszewski wrote:
> On Wed, Jul 28, 2021 at 11:19 PM Ben Hutchings <ben.hutchings@mind.be> wrote:
> >
> > Support for opening chips by label was removed because labels
> > are not necessarily unique and lookup by label requires opening
> > every GPIO device.
> >
> > I don't think these concerns apply to the tools.  They will normally
> > be run by root, and if a label is specified it's because it's known to
> > be unique.
[...]
> > +struct gpiod_chip *chip_open_by_label(const char *label)
> > +{
> > +       struct gpiod_chip *chip = NULL, *next = NULL;
> > +       struct dirent **entries;
> > +       int num_chips, i, error = 0;
> > +
> > +       num_chips = scandir("/dev/", &entries, chip_dir_filter, alphasort);
> > +       if (num_chips < 0) {
> > +               error = errno;
> > +               fprintf(stderr, "unable to scan /dev: %s\n", strerror(error));
> > +               goto out;
> > +       }
> > +
> > +       for (i = 0; i < num_chips; i++) {
> > +               next = chip_open_by_name(entries[i]->d_name);
> > +               if (!next) {
> > +                       error = errno;
> > +                       fprintf(stderr, "unable to open %s: %s\n",
> > +                               entries[i]->d_name, strerror(error));
> 
> How about using access() to check the permissions first? This way we
> wouldn't need to spam the user with error messages - we'd just
> silently ignore chips we don't have access to.
[...]

I don't see any benefit in using access() rather than checking for
EACCES; that just seems to add a race condition.

As for whether the error should be reported, this is consistent with
the old behaviour and I did not want to report that "chip label does
not exist" in case of missing permission.  And again, I would expect
the tools to be run as root, so this shouldn't happen in practice.

Perhaps a better approach would be to record any access failure and
then report it at the end only if the label was not found?

Ben.

-- 
Ben Hutchings · Senior Embedded Software Engineer, Essensium-Mind · mind.be
