Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9AA515A263
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2020 08:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbgBLHsD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Feb 2020 02:48:03 -0500
Received: from mail.intenta.de ([178.249.25.132]:44903 "EHLO mail.intenta.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728329AbgBLHsD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Feb 2020 02:48:03 -0500
X-Greylist: delayed 314 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Feb 2020 02:48:03 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=intenta.de; s=dkim1;
        h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date; bh=zDztaFB1Vm+zJjK82Up84nTQYEDPnANgGo6H6EpgvYU=;
        b=VPy1CJhh+eM44CDCZA/fmgYthNnLs1cx8ew9REYflP4odz7xVrpLJ1TGLJYOiwiT0d8sGnQX46ZI33k+R6UMWAgoDsrpbvuBlBAtQNiHF4BOsgmXJW9A0518kuS5eQ2WJdQFXhTGuT3rNPa6NpFGB8FnyynI0pbNT3epAaUaWquwlzoTk7wMmSEPyBJcg/kqjU+4/0w+w9SjZgEeuGAsuoyAwKPraarp1B9j2td/zMOx8+O5gxe7n+bmHclxoC1Ih4dlyHhmuMp3Ar9nZSUQKr3E17qQhbpomjcbEy+rBVv6WW5ypA++2H9VIVxZOJdkIPl0lgjCk8ABgr75PzWSFQ==;
Date:   Wed, 12 Feb 2020 08:42:44 +0100
From:   Helmut Grohne <helmut.grohne@intenta.de>
To:     <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Subject: [libgpiod] consider changing the license of the C++ bindings
Message-ID: <20200212074243.GA17928@laureti-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ICSMA002.intenta.de (10.10.16.48) To ICSMA002.intenta.de
 (10.10.16.48)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I've recently encountered libgpiod and found that its API is nice to
work with. Thank you for this piece of software.

IANAL

The library is licensed LGPL, which makes it available to non-free uses
in principle. For the C library, I think this is a good license. For the
C++ bindings, LGPL poses a little problem as code can be generated from
the header. For instance, libgpiodcxx is using `ctor() = default;`.
Strict intepretation of the LGPL would mean that a downstream user
should be able to recompile the whole product using libgpiodcxx.
Effectively, libgpiodcxx can be considered GPL (not LGPL) licensed for
practical purposes. You can find more background at:
 * https://blogs.msmvps.com/gdicanio/2016/07/11/the-lgpl-and-libraries-exposing-a-c-interface/
 * Eigen was initially LGPL and was converted to MPL2:
   https://eigen.tuxfamily.org/index.php?title=News:Relicensing_to_MPL2!
 * QT4 has also encountred this:
   https://lwn.net/Articles/315251/
I think that the LGPL when applied to C++ results in an unclear
licensing situation at best and an effective GPL at a strict
interpretation. Varying license interpretation rarely results in
anything good.

For these reasons, I ask you to consider changing the license for
libgpiodcxx only (and not for libgpiod nor for the Python bindings). I
propose following Eigen and switching to MPL2. If however, the intention
is the strict reading of the non-lesser GPL, consider switching to that
instead. Either change improves the clarity of the licensing and makes
the intention visible.

Thank you for considering

Helmut
