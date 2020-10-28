Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C8329D519
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 22:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729200AbgJ1V6o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 17:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728786AbgJ1V6n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 17:58:43 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8029C0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:58:43 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id j7so1126544oie.12
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oRD6HUWUuAzi24CGJ/GQKsSDbMvy+V67itPig7clj0U=;
        b=rnM7N/+j3YKdyzhgwrBnqkrASMfhQ6PRfNOIQqg9MZ77HaBuvw/0WQmglB8zunMsyl
         tSdSjp5g45YblckBhmxzxmRCkR+2WgJisrE1vTSmlRJdlmjrb/uCdzKCWnsSQ7jx5y7F
         48WwM55YLP64VaXlFBDFzqnV0ow92DZUvQ+Sz4z+2+7DuLiTxVLTOuUdNmlfPVhFU2T4
         ogHtkG4dwAADPpZ4gOghKBePVpXonh0hSCDtBpGz8Qi3wqXQXRlzT4HBou7Ts8c4EEmQ
         UKRyXZqbAKC1XXHuNEL0B1VpvU07x/Kdbm/tS9pGpHlSVH6PC9uof2cxmfP4NANScM4x
         +H2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oRD6HUWUuAzi24CGJ/GQKsSDbMvy+V67itPig7clj0U=;
        b=cW9VmEGEfb45y1J/bPWSY03L+6SRAld+yrcKg91oicCPsf9RuRJaKGFckpGNJnyQ/e
         a+9R+j+qVSh+ACVSui2dwtWWA5x5WCdmK6uAWzzHLQHuHv3jatSGPInwdroQqvmN139x
         jvRo0m8hFFGgR1znz1+dSunWsr2Zwsd05b1XetlS88LED4D1QvPdh5KQ+PFyI7bDimCa
         e0AUwEEt0OCEM4TwKYTF7dnSm+bEQAWL9usZ1Lvv3UzXRoiX+xYaIa3sSsxPoKQvHPlT
         /FCED0Rf22cQEzHTYYI01ZACMfrtKOCdf1MHNYTLs0D1ZsjLMi9osOxv9qwMtzdz9alR
         hZ6Q==
X-Gm-Message-State: AOAM532XYDpt0OqzBWWpxN8jW8dRDY+IO6zQdKlf2wN487rJTZcgCwzz
        BxEyzaELnhv/p9hXkLoD6p5GG4E61ZQpMg==
X-Google-Smtp-Source: ABdhPJwYWcogHrcwmO/IhKNLp6aTIGpKbg3smEjZTdD/QnDqGvVwL1qJtH8+2LR18b3GJzqbsSpJrw==
X-Received: by 2002:a17:90b:17c8:: with SMTP id me8mr5880704pjb.144.1603877975050;
        Wed, 28 Oct 2020 02:39:35 -0700 (PDT)
Received: from sol (106-69-179-84.dyn.iinet.net.au. [106.69.179.84])
        by smtp.gmail.com with ESMTPSA id l22sm5485581pff.27.2020.10.28.02.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 02:39:34 -0700 (PDT)
Date:   Wed, 28 Oct 2020 17:39:28 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2] treewide: rework struct gpiod_line_bulk
Message-ID: <20201028093928.GA152368@sol>
References: <20201027091715.8958-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027091715.8958-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 27, 2020 at 10:17:15AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 

Subject should be prefixed with [libgpiod] according to the README ;).

[snip]

> diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
> index e77baa2..e7bd20e 100644
> --- a/bindings/cxx/line_bulk.cpp
> +++ b/bindings/cxx/line_bulk.cpp
> @@ -46,6 +46,29 @@ const ::std::map<::std::bitset<32>, int, bitset_cmp> reqflag_mapping = {
>  	{ line_request::FLAG_BIAS_PULL_UP,	GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP, },
>  };
> 

A - see comment after line_bulk::event_wait()

> +struct line_bulk_iter_deleter
> +{
> +	void operator()(::gpiod_line_bulk_iter *iter)
> +	{
> +		::gpiod_line_bulk_iter_free(iter);
> +	}
> +};
> +
> +using line_bulk_iter_ptr = ::std::unique_ptr<::gpiod_line_bulk_iter,
> +					     line_bulk_iter_deleter>;
> +
> +line_bulk_iter_ptr make_line_bulk_iter(::gpiod_line_bulk *bulk)
> +{
> +	::gpiod_line_bulk_iter *iter;
> +
> +	iter = ::gpiod_line_bulk_iter_new(bulk);
> +	if (!iter)
> +		throw ::std::system_error(errno, ::std::system_category(),
> +					  "Unable to create new line bulk iterator");
> +
> +	return line_bulk_iter_ptr(iter);
> +}
> +

B - see comment after line_bulk::event_wait()

>  } /* namespace */
>  

[snip]

> @@ -263,27 +270,26 @@ line_bulk line_bulk::event_wait(const ::std::chrono::nanoseconds& timeout) const
>  {
>  	this->throw_if_empty();
>  
> -	::gpiod_line_bulk bulk, event_bulk;
> +	line_bulk_ptr ev_bulk(::gpiod_line_bulk_new(this->size()));
> +	auto chip = this->_m_bulk[0].get_chip();

Move chip into the block where it is used.

> +	auto bulk = this->to_line_bulk();
>  	::timespec ts;
>  	line_bulk ret;
>  	int rv;
>  
> -	this->to_line_bulk(::std::addressof(bulk));
> -
> -	::gpiod_line_bulk_init(::std::addressof(event_bulk));
> -
>  	ts.tv_sec = timeout.count() / 1000000000ULL;
>  	ts.tv_nsec = timeout.count() % 1000000000ULL;
>  
> -	rv = ::gpiod_line_event_wait_bulk(::std::addressof(bulk),
> -					  ::std::addressof(ts),
> -					  ::std::addressof(event_bulk));
> +	rv = ::gpiod_line_event_wait_bulk(bulk.get(), ::std::addressof(ts), ev_bulk.get());
>  	if (rv < 0) {
>  		throw ::std::system_error(errno, ::std::system_category(),
>  					  "error polling for events");
>  	} else if (rv > 0) {
> -		for (unsigned int i = 0; i < event_bulk.num_lines; i++)
> -			ret.append(line(event_bulk.lines[i], this->_m_bulk[i].get_chip()));
> +		auto iter = make_line_bulk_iter(ev_bulk.get());
> +		::gpiod_line *curr_line;
> +
> +		gpiod_line_bulk_iter_foreach_line(iter.get(), curr_line)
> +			ret.append(line(curr_line, chip));
>  	}
>  

If you replace the gpiod_line_bulk_iter_foreach_line() here with
manually looping over the bulk lines then everything from A to B above
can be dropped.

i.e. 
-               auto iter = make_line_bulk_iter(ev_bulk.get());
-               ::gpiod_line *curr_line;
+               auto chip = this->_m_bulk[0].get_chip();
+               auto num_lines = ::gpiod_line_bulk_num_lines(ev_bulk.get());

-               gpiod_line_bulk_iter_foreach_line(iter.get(), curr_line)
-                       ret.append(line(curr_line, chip));
+               for (unsigned int i = 0; i < num_lines; i++)
+                       ret.append(line(::gpiod_line_bulk_get_line(ev_bulk.get(), i), chip));

That includes the chip relocation, btw.

[snip]

>  }
> @@ -1715,9 +1751,10 @@ static PyObject *gpiod_LineBulk_event_wait(gpiod_LineBulkObject *self,
>  {
>  	static char *kwlist[] = { "sec", "nsec", NULL };
>  
> -	struct gpiod_line_bulk bulk, ev_bulk;
> -	struct gpiod_line *line, **line_ptr;
> +	struct gpiod_line_bulk *bulk, *ev_bulk;
> +	struct gpiod_line_bulk_iter *iter;
>  	gpiod_LineObject *line_obj;
> +	struct gpiod_line *line;
>  	gpiod_ChipObject *owner;
>  	long sec = 0, nsec = 0;
>  	struct timespec ts;
> @@ -1736,37 +1773,64 @@ static PyObject *gpiod_LineBulk_event_wait(gpiod_LineBulkObject *self,
>  	ts.tv_sec = sec;
>  	ts.tv_nsec = nsec;
>  
> -	gpiod_LineBulkObjToCLineBulk(self, &bulk);
> +	bulk = gpiod_LineBulkObjToCLineBulk(self);
> +	if (!bulk)
> +		return NULL;
> +
> +	ev_bulk = gpiod_line_bulk_new(self->num_lines);
> +	if (!ev_bulk) {
> +		gpiod_line_bulk_free(bulk);
> +		return NULL;
> +	}
>  
>  	Py_BEGIN_ALLOW_THREADS;
> -	rv = gpiod_line_event_wait_bulk(&bulk, &ts, &ev_bulk);
> +	rv = gpiod_line_event_wait_bulk(bulk, &ts, ev_bulk);
> +	gpiod_line_bulk_free(bulk);
>  	Py_END_ALLOW_THREADS;
> -	if (rv < 0)
> +	if (rv < 0) {
> +		gpiod_line_bulk_free(ev_bulk);
>  		return PyErr_SetFromErrno(PyExc_OSError);
> -	else if (rv == 0)
> +	} else if (rv == 0) {
> +		gpiod_line_bulk_free(ev_bulk);
>  		Py_RETURN_NONE;
> +	}
>  
> -	ret = PyList_New(gpiod_line_bulk_num_lines(&ev_bulk));
> -	if (!ret)
> +	ret = PyList_New(gpiod_line_bulk_num_lines(ev_bulk));
> +	if (!ret) {
> +		gpiod_line_bulk_free(ev_bulk);
>  		return NULL;
> +	}
>  
>  	owner = ((gpiod_LineObject *)(self->lines[0]))->owner;
>  
> +	iter = gpiod_line_bulk_iter_new(ev_bulk);
> +	if (!iter) {
> +		gpiod_line_bulk_free(ev_bulk);
> +		return PyErr_SetFromErrno(PyExc_OSError);
> +	}
> +
>  	i = 0;
> -	gpiod_line_bulk_foreach_line(&ev_bulk, line, line_ptr) {
> +	gpiod_line_bulk_iter_foreach_line(iter, line) {
>  		line_obj = gpiod_MakeLineObject(owner, line);
>  		if (!line_obj) {
> +			gpiod_line_bulk_iter_free(iter);
> +			gpiod_line_bulk_free(ev_bulk);
>  			Py_DECREF(ret);
>  			return NULL;
>  		}
>  
>  		rv = PyList_SetItem(ret, i++, (PyObject *)line_obj);
>  		if (rv < 0) {
> +			gpiod_line_bulk_iter_free(iter);
> +			gpiod_line_bulk_free(ev_bulk);
>  			Py_DECREF(ret);
>  			return NULL;
>  		}
>  	}
>  

This function can be simplified by looping over the bulk manually rather
than using the line_bulk_iter.

> +	gpiod_line_bulk_iter_free(iter);
> +	gpiod_line_bulk_free(ev_bulk);
> +
>  	return ret;
>  }
>  
> @@ -2241,41 +2305,59 @@ PyDoc_STRVAR(gpiod_Chip_get_all_lines_doc,
>  static gpiod_LineBulkObject *
>  gpiod_Chip_get_all_lines(gpiod_ChipObject *self, PyObject *Py_UNUSED(ignored))
>  {
> +	struct gpiod_line_bulk_iter *iter;
>  	gpiod_LineBulkObject *bulk_obj;
> -	struct gpiod_line_bulk bulk;
> +	struct gpiod_line_bulk *bulk;
>  	gpiod_LineObject *line_obj;
>  	struct gpiod_line *line;
> -	unsigned int offset;
> +	unsigned int index = 0;
>  	PyObject *list;
>  	int rv;
>  
>  	if (gpiod_ChipIsClosed(self))
>  		return NULL;
>  
> -	rv = gpiod_chip_get_all_lines(self->chip, &bulk);
> -	if (rv)
> +	bulk = gpiod_chip_get_all_lines(self->chip);
> +	if (!bulk)
>  		return (gpiod_LineBulkObject *)PyErr_SetFromErrno(
>  							PyExc_OSError);
>  
> -	list = PyList_New(gpiod_line_bulk_num_lines(&bulk));
> -	if (!list)
> +	list = PyList_New(gpiod_line_bulk_num_lines(bulk));
> +	if (!list) {
> +		gpiod_line_bulk_free(bulk);
>  		return NULL;
> +	}
>  
> -	gpiod_line_bulk_foreach_line_off(&bulk, line, offset) {
> +	iter = gpiod_line_bulk_iter_new(bulk);
> +	if (!iter) {
> +		gpiod_line_bulk_free(bulk);
> +		Py_DECREF(list);
> +		return (gpiod_LineBulkObject *)PyErr_SetFromErrno(
> +							PyExc_OSError);
> +	}
> +
> +	gpiod_line_bulk_iter_foreach_line(iter, line) {
>  		line_obj = gpiod_MakeLineObject(self, line);
>  		if (!line_obj) {
> +			gpiod_line_bulk_iter_free(iter);
> +			gpiod_line_bulk_free(bulk);
>  			Py_DECREF(list);
>  			return NULL;
>  		}
>

Again, NOT using the line_bulk_iter here, and manually looping instead, is
actually simpler and cleaner.

Cheers,
Kent.

