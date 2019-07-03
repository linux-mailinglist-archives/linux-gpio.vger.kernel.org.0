Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18EDA5E38B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 14:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfGCMMe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 08:12:34 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43718 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfGCMMd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 08:12:33 -0400
Received: by mail-ot1-f68.google.com with SMTP id q10so2065270otk.10;
        Wed, 03 Jul 2019 05:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mH2lyxDMkrD7XdLOxAFWGZyjvyOXaNVi0/ntCaxja1Y=;
        b=CtYhWINebh0TkuL+oXcaXo183wNNBg6jq4kBnoqD4X5Lt4Vhcyoochri/u/cY6y6El
         y76PWe4b0agnkFCB5lWeO8QXTRw3iGVqZZnJYEKjpsmZ7tJHeLFeqpuaVad8p+SH1MBj
         uRdE5wjDx/nrBSZ10/v1tsRnVD0XmuND8FsBFiZ72mPWKT3YUGrtXrR5nB8bxKuHNoPn
         qI1/geq5LfbEluFVoreQC/bhwvWszF4iHfZxMBPzbpfQC78N0z9RQ42vIMUgGFw7Wozb
         EbeOWgaoRnO3AqXqn0PXEC1DwnGGeQXLqJy8UQguQvty39kol54Blk3MoAAsxP7g2Olj
         18cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mH2lyxDMkrD7XdLOxAFWGZyjvyOXaNVi0/ntCaxja1Y=;
        b=UtCd+xiV3G0sgCRB7tOL0pA6rgS3HwcI/QKp1KjWDtvO9wS4iLo+dUuwYhio9e6i90
         o1RP7hQ0v5p2Vt/cVEg/kOQGtJMMmdYqwFFFEODEbW+qtL/XhQizTujRMXn4Hg/fEK9m
         ghLNcQ2cJ0GUvEAlRHdiVbFWYhw79EVSGZQSmPK5/vGU089QhOPlJ38cYbGmzuHKK+p2
         EC7/Q5subiriR8MOtQfeND1ebgx/DTOIzcJHgs6e61wPMuxK/PSjJEICCX0fZTWQ72/X
         tbRh4RJks22CTicZFrPEca6ogsPNm80DFaEt9QFck3JHxlN1IKdtu+NcfhiCQz/RVDjP
         CQhA==
X-Gm-Message-State: APjAAAVVbONO+b+vv+e3ejkMQbSSuaIMjauWp5Nm0xo+IXnKPnPyqXux
        25/+t/sThUuLs8oRWvHi5dCxdBlTG2Qj5Du9GeM=
X-Google-Smtp-Source: APXvYqyHjGppN3tIIiaPddI2WT4l1OOcds5DkRdEgJQOZDr9uZ31b+RJY1XmKW37lEvv3kuJ9imk6UwFGNQZzxqlDPY=
X-Received: by 2002:a9d:226c:: with SMTP id o99mr27745852ota.42.1562155952743;
 Wed, 03 Jul 2019 05:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-12-narmstrong@baylibre.com> <CAFBinCBg57gh1x3CKs-YrCvTD0WR2s5zVGWtycb=RGqMiQ-VgA@mail.gmail.com>
 <7acdafc1-39e7-a2ec-886f-ca337c60dfe7@baylibre.com>
In-Reply-To: <7acdafc1-39e7-a2ec-886f-ca337c60dfe7@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 3 Jul 2019 14:12:21 +0200
Message-ID: <CAFBinCC1sJxBA8NgDNzLaWJV7Y+fARVczy31rHkbtkj58XKUUQ@mail.gmail.com>
Subject: Re: [RFC/RFT v3 11/14] arm64: dts: meson-g12a: add cpus OPP table
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     jbrunet@baylibre.com, khilman@baylibre.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Neil,

On Wed, Jul 3, 2019 at 1:53 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 03/07/2019 01:47, Martin Blumenstingl wrote:
> > Hi Neil,
> >
> > On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> Add the OPP table taken from the vendor u200 and u211 DTS.
> >>
> >> The Amlogic G12A SoC seems to available in 3 types :
> >> - low-speed: up to 1,8GHz
> >> - mid-speed: up to 1,908GHz
> >> - high-speed: up to 2.1GHz
> >>
> >> And the S905X2 opp voltages are slightly higher than the S905D2
> >> OPP voltages for the low-speed table.
> >>
> >> This adds the conservative OPP table with the S905X2 higher voltages
> >> and the maximum low-speed OPP frequency.
> > have you considered all three as separate voltage tables?
> > you're other patches are assigning the OPP table to the CPU in the
> > board.dts anyways, so it's easy to use different OPP tables for
> > different boards
>
> We can't assume the board and the CPU type :-/
OK, should we assign the OPP table to the CPU cores then in the
soc.dtsi (instead of board.dts like the other patches from this series
do)?

> Kevin told me about cpufreq policy, where we could add a policy reading the
> eFUSE and changing the max frequency, then we could add the whole OPP table.
we can still do that in a second step, so I'm all for starting with
the "conservative" OPP table and then improve performance (by having
detecting the SoC and using the correct OPP table)


Martin
