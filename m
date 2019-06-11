Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE82F3D1FA
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 18:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405506AbfFKQOQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 12:14:16 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:38089 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405393AbfFKQOQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 12:14:16 -0400
Received: from [192.168.1.110] ([95.118.191.213]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MdNTy-1h1Oeo3XbU-00ZQ4b; Tue, 11 Jun 2019 18:14:02 +0200
Subject: Re: [PATCH] RFC: fmc: Try to convert to GPIO descriptors
To:     Alessandro Rubini <rubini@gnudd.com>
Cc:     linus.walleij@linaro.org, federico.vaga@cern.ch,
        linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        riehecky@fnal.gov
References: <fd1ad233-62aa-8545-a01e-511ea3db9f83@metux.net>
 <CACRpkdaCFZcQ8VMjKJkXAm+TRH+=DY3j5Udh0mcYR7YcDr8VtA@mail.gmail.com>
 <20190603230604.30938-1-linus.walleij@linaro.org>
 <22282873.PltXLBtAh5@pcbe13614> <20190610061325.GA9668@mail.gnudd.com>
 <20190611145850.GA15743@mail.gnudd.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <6006a8cd-ac80-93d0-bd61-cf2392655519@metux.net>
Date:   Tue, 11 Jun 2019 18:14:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190611145850.GA15743@mail.gnudd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:fej2J/qPxGVEgBSl7nQxdsyAEVnKErRg3so6lnPHbMlUEtB5ghg
 4Qsc+F/vyoiTbz6A6WHBb+gLO2Z40jVlAe3nzOrQv7ugRyfDf3HzbIhGNmRTVCw6n2SIq2O
 jUF4IactWQV5wJlmIDFLhyiaRWlUwu4WenzuVTjQQJDuRr69EvL2qofTbyRByDlaqIT6lUO
 I2LBsR2/pS2RPx5tFqdlQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sYEz/TW4UKs=:Dv0de4ETI7Xee8Xv78n0mw
 dN33EhbpOudRdbCB+gOiN/zkgAu03bh5AaswZQHKyLGbpgrHB29+WYCM1XIT3BMvYZxkD4Dh2
 F13k9cxSVLpDgxs5HOQCAUUiiu0hgY+a14CXa/THGvQ6PV/UInOVSG6mNKyJFGzCKb4XvgxVU
 gzvS767Z5pYqR8460DOhb0oiRQl2l3ugxqHSucwHwfSK4XdTj1RSf0an9bQmddyDL7usa8F0R
 wKF5H/yZaoJf/dIZrp5vv4Kyj8jRuoEPpK0F/GiA99j8WhlrmxkG/jVKGZKnTbbCGaxAw6843
 WqkgBiOPQjSe9vWikpdfPH5/r6pNv+UA8DeKEY1rZDREQ3W1Mr52Neu01f0HfjIqazhsWVoem
 XbwAJpO96XeYM12cFzeMRwlHkYhIJ5+MniL8Dc7RglUQG63Fs+hMlFzZ8S4PL3JKqhKDyJCNu
 S8QUGksIzfaO3xEpPmyOPmBkKS0hv7sj+JEz2SFqtXVvMOoilOatxcTGvyV5GuuFBEQYn9hN5
 kdgkzSsE7v7QsZqTPvAOXbXpDwMd99z3fbD4Et07r7TIIOcSLqUlEut02iOGRpMJTT7sqVeQF
 nwqs/Wr5Np0a9TYxKwYJmryXzo18KjXaKdtf7Xa8CbiDweBw5/6Q0IAMqi0jPk4ok0078Ypba
 7xhGxqbb1+heT0J8wzpqgeLeLR3aKNTxPjU9T7CgwDn2cJJ1OQM0CZQSPeCulX79jYkoC46bt
 xIRf0HSxbGlWZbtu7l+pC96nxpVbtjEpakHD7u4XXTmAlt8nsiEychTsYEM=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11.06.19 16:58, Alessandro Rubini wrote:

Hi,

> This FMC (fpga mezzanine carrier) is a "slot" for peripheral boards.
> Like shields for beaglebone or such stuff.  So there is a board
> (and our own are actually pci-x and vme) with the FPGA, and the pins
> are carried to this "mezzanine" where the I/O happens. The mezzanine
> is usually just dumb, but it has the mandatory eeprom.

Ah, the fpga directly terminates w/ pcix or vme ?

Okay, now I'm begining to get a picture ...

So, from *logical* point of view (leaving aside the physical aspects),
we have either pcix or vme cards, carrying an eepromp and an fpga ?
The i2c and gpio controllers are also implemented in the fpga ?

> So, our "fine delay" board, that can timestamp pulses and generate
> other pulses at precise times) can plug in both the pcix and vme carrier.

Do the bitfiles differ between pcix and vme case ?

> The tow major ones, IIUC, are (1) the same mezzanine would require
> different bitstreams according to external information and (2) the
> fpga binary itself my expose different "devices" where a generalized
> driver would benefit, instead of a mezzanine-specific driver.

Have you already tried the MFD approach, where a board (in this case:
bitfile) specific driver instantiates several generic ones ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
