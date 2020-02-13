Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC93415BCB0
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2020 11:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729736AbgBMKXC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Feb 2020 05:23:02 -0500
Received: from mail.intenta.de ([178.249.25.132]:31573 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729428AbgBMKXC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Feb 2020 05:23:02 -0500
X-Greylist: delayed 436 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Feb 2020 05:23:02 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date; bh=xDWeOIvLELdhKO/BxwyOkoSeks1Qa/qy0pq+uOUUAYk=;
        b=YfMA2D1UkhvDrEl2eM/5zCsAcDLllgLMvp4Inq2h3Im9XQIwfHIjn+qcBb6CEwsVUSKurgLi8q3tvI3dCqi8QfROegJhr9ZNNKPOxpDA5IS5oEUS8fvnCQgsDF/G3It9aASj4c5zAOi8W1P7yCa0Dm1/1Ly/StVQW8JACCauiRaIVTrU988EyA58dZVK842LVySBgP5tjpo2N86V8FhF5/dn9fzsbeyc7qCUdr5vIHUPDK4Sq4m2U6EBgYEwaHPuZNAza5sPN9qkPHa8ihw02SVtD35ZgGrFHNfb2ZqUFoIeKPlAIZETqSFQ0Rm5yg7dNJpjFGM4afLrJTAG8uT5kg==;
Date:   Thu, 13 Feb 2020 11:15:42 +0100
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartekgola@gmail.com>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [libgpiod] consider changing the license of the C++ bindings
Message-ID: <20200213101542.GA16222@laureti-dev>
References: <20200212074243.GA17928@laureti-dev>
 <CAMRc=Mdj6whafFQ9KN+gi8HhKCSfkhGtqhO-+AM+3JEb5MCQPA@mail.gmail.com>
 <CAMRc=Mdcg2hp0VUsQHO2kW_uTiDAvDTCckad9D5Ja002wn1LAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdcg2hp0VUsQHO2kW_uTiDAvDTCckad9D5Ja002wn1LAA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 12, 2020 at 01:58:40PM +0100, Bartosz Golaszewski wrote:
> one more thing that's unclear to me: I found this post[1] on the eigen
> mailing list and started wondering: what makes MPL2 better than LGPL3?
...
> [1] https://listengine.tuxfamily.org/lists.tuxfamily.org/eigen/2008/02/msg00003.html

Thank you for pointing me to this. I mostly looked at the LGPL-2.1 and
overlooked the fact that libgpiod already uses the "later version"
language permitting use of LGPL-3. Indeed, the situation is much better
for LGPL-3 due to precisely the paragraphs referenced in that mail.

Thank you

Helmut
