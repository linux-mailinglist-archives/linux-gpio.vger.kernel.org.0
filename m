Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6F841F990
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Oct 2021 06:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhJBEIA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Oct 2021 00:08:00 -0400
Received: from smtprelay0163.hostedemail.com ([216.40.44.163]:50444 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229560AbhJBEIA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Oct 2021 00:08:00 -0400
X-Greylist: delayed 324 seconds by postgrey-1.27 at vger.kernel.org; Sat, 02 Oct 2021 00:07:59 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 99FE9180782A4;
        Sat,  2 Oct 2021 04:00:51 +0000 (UTC)
Received: from omf12.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 51090100E7B52;
        Sat,  2 Oct 2021 04:00:49 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id 1ED57240235;
        Sat,  2 Oct 2021 04:00:46 +0000 (UTC)
Message-ID: <fbab80553b993421e064b61814a7e5c634f62e6e.camel@perches.com>
Subject: Re: [RFC v2 11/11] MAINTAINERS: Added HTE Subsystem
From:   Joe Perches <joe@perches.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        warthog618@gmail.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
Date:   Fri, 01 Oct 2021 21:00:45 -0700
In-Reply-To: <b6a968cb-1d7b-887c-8995-6e6b9fef03bf@infradead.org>
References: <20210930232617.6396-1-dipenp@nvidia.com>
         <20210930232617.6396-12-dipenp@nvidia.com>
         <b6a968cb-1d7b-887c-8995-6e6b9fef03bf@infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1ED57240235
X-Spam-Status: No, score=-0.64
X-Stat-Signature: hgk6z5sz6jieutxqdrx7yuux4xd3imtu
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19mvdfNloEqShYZNn11H8x47SYY6vDcqBg=
X-HE-Tag: 1633147246-448701
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2021-10-01 at 17:08 -0700, Randy Dunlap wrote:
> On 9/30/21 4:26 PM, Dipen Patel wrote:
> > Added myself as a maintainer for this new Hardware Timestamping Engine
> > (HTE) subsystem.
[]
> > diff --git a/MAINTAINERS b/MAINTAINERS
[]
> > +S:	Maintained
> > +F:	drivers/hte/*
> > +F:	include/linux/hte.h
> > +F:	Documentation/hte/*
> > +F:	Documentation/devicetree/bindings/hte/*

And using * does not support any possible subdirectory

Likely these should be:

F:	drivers/hte/
F:	include/linux/hte.h
F:	Documentation/hte/
F:	Documentation/devicetree/bindings/hte/


